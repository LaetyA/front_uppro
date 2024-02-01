import express from "express";
import bodyParser from "body-parser";
import axios from "axios";
import morgan from "morgan"
import {dirname} from "path";
import { fileURLToPath } from "url";
import mysql from "mysql2"




const app = express();
app.use(morgan('dev'));

const port = 3000;
const  __dirname = dirname(fileURLToPath(import.meta.url));

// const connection = mysql.createConnection({
//     host: 'localhost',
//     user: 'root', // Utilisateur MySQL
//     password: '', // Aucun mot de passe
//     database: 'sirh'
//   });
  
//   connection.connect((err) => {
//     if (err) {
//       console.error('Erreur de connexion à MySQL :', err);
//     } else {
//       console.log('Connexion à MySQL réussie');
//     }
//   });

app.use(bodyParser.urlencoded({ extended: true }));


app.use(express.static('public'));

// app.get("/listeP",async(req,res)=>{
//   try {

//     const response = await axios.get("http://127.0.0.1:8000/api/api/drh/personnels/liste");

//     const result = response.data.items;
//     // console.log(result)
//     res.render("listePersonne.ejs",{data:result});
//     // res.send(result)

//   } catch (error) {
    
//     console.error("Erreur lors de la requête API :", error.message);
//     res.status(500).send("Erreur lors de la requête API");
//   }
// })


app.get("/dashboard", async (req, res) => {
  try {
    const response = await axios.get("http://127.0.0.1:8000/api/api/drh/personnels/liste");
    const persons = response.data.items;

    const totalPersons = persons.length;
    const teachers = persons.filter(person => person.fonction === 'Enseignant').length;
    const administrativeStaff = persons.filter(person => person.fonction === 'Personnel Administratif').length;
    const females = persons.filter(person => person.sexe === 'femme').length;

    const percentageTeachers = (teachers / totalPersons) * 100;
    const percentageAdministrativeStaff = (administrativeStaff / totalPersons) * 100;
    const percentageFemales = (females / totalPersons) * 100;

    res.render("accueil.ejs", {
      data: {
        exampleData: persons,
        statistics: {
          percentageTeachers,
          percentageAdministrativeStaff,
          percentageFemales
        }
      }
    });
  } catch (error) {
    console.error("Erreur lors de la requête API :", error.message);
    res.status(500).render("error.ejs", { errorMessage: "Erreur lors de la requête API" });
  }
});


app.get("/statistique", async (req, res) => {
  try {
    const response = await axios.get("http://127.0.0.1:8000/api/api/drh/personnels/liste");
    const result = response.data.items;
    res.render("statistique.ejs", { data: result });
  } catch (error) {
    console.error("Erreur lors de la requête API :", error.message);
    res.status(500).render("error.ejs", { errorMessage: "Erreur lors de la requête API" });
  }
});

app.get("/listeP", async (req, res) => {
  try {
    

    const headers = {
      // Ajoutez le token dans l'en-tête 'Authorization'
      Authorization: `Bearer ${accessToken}`
    };

    const apiEndpoint = "http://127.0.0.1:8000/api/api/drh/personnels/liste";

    const response = await axios.get(apiEndpoint, { headers });

    const result = response.data.items;
    res.render("listePersonne.ejs", { data: result });
  } catch (error) {
    console.error("Erreur lors de la requête API :", error.message);
    res.status(500).send("Erreur lors de la requête API");
  }
});


app.get("/",(req,res) =>{
    // res.sendFile(__dirname+"/views/authentification.html");
    res.render("login.ejs")

})
// app.get("/register",(req,res) =>{
//     res.sendFile(__dirname+"/views/register.html");
//     // res.render("login.ejs")
// })
app.get("/login",(req,res) =>{
    // res.sendFile(__dirname+"/views/login.html");
    res.render("login.ejs")
})
// Déclarez une variable à un niveau global pour stocker les tokens
let accessToken;

app.post("/login", async (req, res) => {
  const formData = {
    username: req.body.username,
    password: req.body.password
  };

  try {
    const apiEndPoint = "http://127.0.0.1:8000/api/api/drh/drh/connexion";
    const response = await axios.post(apiEndPoint, formData);

    if (response.status === 200) {
      // Stockez le token dans la variable globale
      accessToken = response.data.token;

      // Vous pouvez maintenant utiliser 'accessToken' dans d'autres parties de votre application
      res.render("accueil.ejs");
    } else {
      res.status(response.status).send("erreur connexion");
    }
  } catch (error) {
    console.error("erreur api");
    res.status(500).send("erreur lors de la connexion");
  }
});

// Vous pouvez maintenant utiliser 'accessToken' dans d'autres parties de votre application
// Par exemple, vous pouvez l'utiliser dans d'autres routes ou fonctions
// en tant que variable globale accessible.


// bon login
// app.post("/login",async (req,res)=>{
//   const formData ={
//     username:req.body.username,
//     password:req.body.password
//   }
//   try{
//     const apiEndPoint = "http://127.0.0.1:8000/api/api/drh/drh/connexion";
//     const response = await axios.post(apiEndPoint,formData);
//     if(response.status===200){
//       res.render("accueil.ejs");
//     }
//     else{
//       res.status(response.status).send("erreur connexion")
//     }
//   }
//   catch(error){
//     console.error("erreur api");
//     res.status(500).send("erreur lors de la connexion")
//   }
// })




// app.post("/register",(req,res) =>{
//     const nom = req.body.nom;
//     const poste = req.body.poste;
//     const username = req.body.username;
//     const password = req.body.password;

//   const insertUserQuery = 'INSERT INTO users (nom, poste,username, password) VALUES (?, ?,?,?)';

//   connection.query(insertUserQuery, [nom,poste,username, password], (err, results) => {
//     if (err) {
//       console.error('Erreur lors de l\'insertion de l\'utilisateur :', err);
//       res.status(500).send('Erreur lors de l\'inscription.');
//     } else {
//       console.log('Utilisateur enregistré avec succès');
//       // res.sendFile(__dirname+"/views/login.html");
//       res.render("login.ejs")

//     }
//   });

// })

app.get("/dashboard",(req,res) =>{
 
    res.render("accueil.ejs")
})
app.get("/personne",async (req,res)=>{
  res.render("personne.ejs")
 

})
app.post("/persoForm", async (req, res) => {
  try {
      // Extraire les données du formulaire depuis req.body
      const formData = {
          nom: req.body.nom,
          prenoms: req.body.prenoms,
          Matricule: req.body.Matricule,
          id_Grade: req.body.id_Grade,
          date_prise_service: req.body.date_prise_service,
          date_debut: req.body.date_debut,
          date_retraite: req.body.date_retraite,
          lieu_habitat: req.body.lieu_habitat,
          sit_matrimonial: req.body.sit_matrimonial,
          nbre_Enfant: req.body.nbre_Enfant,
          date_Naiss: req.body.date_Naiss,
          email_institut : req.body.email_institut,
          email_perso : req.body.email_perso,
          telephone: req.body.telephone,
          fonction:req.body.fonction,
          sexe:req.body.sexe
          
      };
      // console.log(formData)

      const response = await axios.post("http://127.0.0.1:8000/api/api/drh/personnels/ajouter", formData);
      console.log(response.data);
   

      res.redirect("/personne")
  } catch (error) {
      console.error("Erreur API : ", error.message);
      res.status(500).send("Erreur appel API");
  }
});

app.post("/modifPerso/:id", async (req, res) => {
  try {
    // Extractez les données du formulaire depuis req.body
    const formData = {
      nom: req.body.nom,
      prenoms: req.body.prenoms,
      Matricule: req.body.Matricule,
      id_Grade: req.body.id_Grade,
      date_prise_service: req.body.date_prise_service,
      date_debut: req.body.date_debut,
      date_retraite: req.body.date_retraite,
      lieu_habitat: req.body.lieu_habitat,
      sit_matrimonial: req.body.sit_matrimonial,
      nbre_Enfant: req.body.nbre_Enfant,
      date_Naiss: req.body.date_Naiss,
      email_institut: req.body.email_institut,
      email_perso: req.body.email_perso,
      telephone: req.body.telephone,
      fonction:req.body.fonction,
      sexe:req.body.sexe,
      id_Perso: req.params.id, // Utilisez req.params.id pour obtenir l'ID de l'URL
    };

    // Utilisez directement l'id_Perso extrait du formulaire
    // console.log(formData.id_Perso);

    const response = await axios.put(`http://127.0.0.1:8000/api/api/drh/personnels/modifier/${formData.id_Perso}`, formData);

    // console.log(response.data); // Affichez la réponse de l'API
    res.redirect("/listeP");
  } catch (error) {
    console.error("Erreur API : ", error.message);
    res.status(500).send("Erreur appel API");
  }
});




app.get('/ajouter', (req, res) => {
  const typeAjout = req.query.type_ajout;

})
app.get("/historique",(req,res) =>{
  // res.render("absence.ejs")
  res.redirect("/accueil")
})

app.get("/accueil",(req,res) =>{
  res.render("accueil.ejs")
})
// Définir la route pour le formulaire d'ajout de formation
app.get('/ajouter-formation', (req, res) => {
  res.render('formation.ejs');
})
app.post("/ajoutFormation",async (req,res)=>{
 try {
  const formData ={
    "nom_Forma": req.body.nomFormation,
		"dure_Forma":req.body.duree,
		"Date_Forma":req.body.debutFormation
  }
  const response = await axios.post("http://127.0.0.1:8000/api/api/drh/formation/ajouter",formData) 
  console.log(formData)
  console.log(response.data)
  res.redirect("/listP")
 } catch (error) {
  console.error("Erreur API : ", error.message);
      res.status(500).send("Erreur appel API");
 }
})


app.get("/ajouter-absence", async (req, res) => {
  try {

    const response = await axios.get("http://127.0.0.1:8000/api/api/drh/absence/liste");

    const result = response.data.items;
    // console.log(result)
    res.render("absence.ejs",{data:result});
    // res.send(result)

  } catch (error) {
    
    console.error("Erreur lors de la requête API :", error.message);
    res.status(500).send("Erreur lors de la requête API");
  }
});

// Gérer la soumission du formulaire d'ajout d'absence
app.post("/ajoutAbsence",async (req,res)=>{
  try {
   const formData ={
    "id_Perso": req.body.id_Perso,
    //  "nom_Forma": req.body.motif,
     "date_Aller":req.body.dateDebutAbsence,
     "date_Retour":req.body.dateFinAbsence,
     "motif_abs":req.body.dateFinAbsence
   }
   const response = await axios.post("http://127.0.0.1:8000/api/api/drh/absence/ajouter",formData) 
   console.log(formData)
   console.log(response.data)
   res.redirect("/listeP")
  } catch (error) {
   console.error("Erreur API : ", error.message);
       res.status(500).send("Erreur appel API");
  }
 })



// app.get('/listeAbsence', async (req, res) => {
//     try {
//         const response = await axios.get('http://127.0.0.1:8000/api/api/drh/absence/liste');
//         let absences = response.data.items;

//         // Trier les absences par date de retour (du plus ancien au plus récent)
//         absences.sort((a, b) => new Date(a.date_Retour) - new Date(b.date_Retour));

//         res.render('listeAbsence.ejs', { absences });
//     } catch (error) {
//         console.error('Erreur lors de la récupération des données :', error);
//         res.status(500).send('Erreur lors de la récupération des données');
//     }
// });



function formatDate(dateString) {
  const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
  return new Date(dateString).toLocaleDateString('fr-FR', options);
}

// Middleware pour rendre formatDate accessible dans le contexte EJS
app.use((req, res, next) => {
  res.locals.formatDate = formatDate;
  next();
});


app.get('/listeAbsence', async (req, res) => {
  try {
      // Récupérer les informations de l'absence
      const absenceResponse = await axios.get('http://127.0.0.1:8000/api/api/drh/absence/liste');
      let absences = absenceResponse.data.items;
      absences.sort((a, b) => new Date(a.date_Retour) - new Date(b.date_Retour));

      // Récupérer les informations de toutes les personnes
      const personneResponse = await axios.get('http://127.0.0.1:8000/api/api/drh/personnels/liste');
      const personnels = personneResponse.data.items;

      // Associer chaque absence à son nom et prénom correspondant
      absences.forEach(absence => {
          const personne = personnels.find(personne => personne.id_Perso === absence.id_Perso);
          if (personne) {
              absence.nom = personne.nom;
              absence.prenoms = personne.prenoms;
          } else {
              absence.nom = 'Inconnu';
              absence.prenoms = 'Inconnu';
          }
      });

      // Rendre la page avec les informations de toutes les absences et de toutes les personnes
      res.render('listeAbsence.ejs', { absences });
  } catch (error) {
      console.error('Erreur lors de la récupération des données :', error);
      res.status(500).send('Erreur lors de la récupération des données');
  }
});










app.listen(port,()=>{
    console.log(`listenning on port ${port} `)
})