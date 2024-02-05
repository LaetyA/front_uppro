-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 05 fév. 2024 à 11:35
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `drhpuuml`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

CREATE TABLE `absences` (
  `id_Abs` int(10) UNSIGNED NOT NULL,
  `id_Perso` int(10) UNSIGNED NOT NULL,
  `date_Aller` date NOT NULL,
  `motif_abs` text NOT NULL,
  `date_Retour` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `absences`
--

INSERT INTO `absences` (`id_Abs`, `id_Perso`, `date_Aller`, `motif_abs`, `date_Retour`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-01-01', 'maladie', '2024-02-07', '2024-02-01 08:52:26', '2024-02-01 08:52:26'),
(2, 1, '2024-02-01', 'Maladie', '2024-02-15', '2024-02-01 10:28:35', '2024-02-01 10:28:35');

-- --------------------------------------------------------

--
-- Structure de la table `dossiers`
--

CREATE TABLE `dossiers` (
  `id_dossier` int(10) UNSIGNED NOT NULL,
  `id_Perso` int(10) UNSIGNED NOT NULL,
  `fichier` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `d_r_h_s`
--

CREATE TABLE `d_r_h_s` (
  `id_DRH` int(10) UNSIGNED NOT NULL,
  `UserDRH` varchar(250) NOT NULL,
  `PasswordDRH` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ecoles`
--

CREATE TABLE `ecoles` (
  `id_ecole` int(10) UNSIGNED NOT NULL,
  `TypeEcole` enum('ESI','ESCAE','ESTP','ESMG','EP','ESA') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `id_Ens` int(10) UNSIGNED NOT NULL,
  `specialite` text NOT NULL,
  `titre` text NOT NULL,
  `id_ecole` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `id_forma` int(10) UNSIGNED NOT NULL,
  `nom_Forma` varchar(250) NOT NULL,
  `dure_Forma` date DEFAULT NULL,
  `Date_Forma` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forma_pers`
--

CREATE TABLE `forma_pers` (
  `id_Perso` int(10) UNSIGNED NOT NULL,
  `id_forma` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `grades`
--

CREATE TABLE `grades` (
  `id_Grade` int(10) UNSIGNED NOT NULL,
  `TypeGrades` enum('A1','A2','A3','A4','A5','A6','A7','B1','B2','B3','C1','C2','C3','D1','D2') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `grades`
--

INSERT INTO `grades` (`id_Grade`, `TypeGrades`, `created_at`, `updated_at`) VALUES
(1, 'A1', '2024-01-23 23:44:22', '2024-01-23 23:44:22'),
(2, 'A2', '2024-01-23 23:44:22', '2024-01-23 23:44:22'),
(3, 'A3', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(4, 'A4', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(5, 'A5', '2024-01-23 23:45:42', '2024-01-30 23:45:42'),
(6, 'A6', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(7, 'A7', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(8, 'B1', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(9, 'B2', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(10, 'B3', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(11, 'C1', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(12, 'C2', '2024-01-23 23:45:42', '2024-01-23 23:45:42'),
(13, 'C3', '2024-01-23 23:49:06', '2024-01-23 23:49:06'),
(14, 'D1', '2024-01-23 23:49:06', '2024-01-23 23:49:06'),
(15, 'D2', '2024-01-23 23:49:42', '2024-01-23 23:49:42'),
(16, NULL, '2024-01-23 23:49:42', '2024-01-23 23:49:42');

-- --------------------------------------------------------

--
-- Structure de la table `historiques`
--

CREATE TABLE `historiques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_09_080445_create_personnes_table', 1),
(6, '2024_01_09_080516_create_formations_table', 1),
(7, '2024_01_09_080531_create_absences_table', 1),
(8, '2024_01_09_080548_create_dossiers_table', 1),
(9, '2024_01_09_080623_create_grades_table', 1),
(10, '2024_01_09_080649_create_forma_pers_table', 1),
(11, '2024_01_09_080717_create_per_admins_table', 1),
(12, '2024_01_09_080734_create_enseignants_table', 1),
(13, '2024_01_09_080755_create_user_d_r_h_s_table', 1),
(14, '2024_01_09_080814_create_d_r_h_s_table', 1),
(15, '2024_01_09_080843_create_services_table', 1),
(16, '2024_01_09_080855_create_ecoles_table', 1),
(17, '2024_01_13_141335_add_id_grade_to_personnes', 1),
(18, '2024_01_13_141845_add_id_service_to_per_admins', 1),
(19, '2024_01_13_142239_add_id_ecole_to_enseignants', 1),
(20, '2024_01_22_103212_add_timestamps_to_enseignants_name', 1),
(21, '2024_01_22_103335_add_timestamps_to_enseignants', 1),
(22, '2024_01_22_110143_add_timestamps_to_d_r_h_s', 1),
(23, '2024_01_22_110202_add_timestamps_to_user_d_r_h_s', 1),
(24, '2024_01_22_115324_modify_passworduser_column_size', 1),
(25, '2024_01_22_120805_drop_nom_column_from_ecole_table', 1),
(26, '2024_01_22_121402_add_fonction_and_sexe_to_personne_table', 1),
(27, '2024_01_22_125859_create_historiques_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE `personnes` (
  `id_Perso` int(10) UNSIGNED NOT NULL,
  `nom` varchar(250) NOT NULL,
  `prenoms` varchar(250) NOT NULL,
  `date_Naiss` date DEFAULT NULL,
  `Matricule` text DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_prise_service` date DEFAULT NULL,
  `date_retraite` date DEFAULT NULL,
  `email_institut` text DEFAULT NULL,
  `email_perso` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `lieu_habitat` text DEFAULT NULL,
  `sit_matrimonial` text DEFAULT NULL,
  `nbre_Enfant` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_Grade` int(10) UNSIGNED DEFAULT NULL,
  `fonction` varchar(255) DEFAULT NULL,
  `sexe` enum('homme','femme','autre') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`id_Perso`, `nom`, `prenoms`, `date_Naiss`, `Matricule`, `date_debut`, `date_prise_service`, `date_retraite`, `email_institut`, `email_perso`, `telephone`, `lieu_habitat`, `sit_matrimonial`, `nbre_Enfant`, `created_at`, `updated_at`, `id_Grade`, `fonction`, `sexe`) VALUES
(1, 'aaron', 'titi', '2024-01-01', 'titi', '2024-01-02', '2024-01-03', '2024-03-14', 'titi@gmail.com', 'titi@gmail.com', '65555', 'titi', 'Marié', 5, '2024-01-23 23:50:57', '2024-02-01 08:51:53', 1, 'Enseignant', 'femme'),
(2, 'tan', 'tan', '2024-01-02', 'tan', '2024-01-02', '2024-01-02', '2024-04-25', 'tan', 'tan', 'tan', 'tan', 'tan', 4, '2024-01-23 23:50:57', '2024-01-23 23:50:57', 6, 'Enseignant', 'homme'),
(3, 'Smith', 'Emma', '1985-03-15', 'Smith', '2010-09-01', '2010-09-01', '2024-04-25', 'emma.smith@email.com', 'emma.smith@email.com', '123-456-7890', 'Cityville', 'Célibataire', 0, '2024-01-24 09:16:05', '2024-01-24 09:16:05', 7, 'Personnel Administratif', 'femme'),
(4, 'Johnson', 'Chris', '1990-07-10', 'Johnson', '2015-02-20', '2015-02-20', '2024-05-13', 'chris.johnson@email.com', 'chris.johnson@email.com', '987-654-3210', 'Townsville', 'Marié', 3, '2024-01-24 09:16:05', '2024-01-24 09:16:05', 9, 'Enseignant', 'homme'),
(5, 'Martinez', 'Sophie', '1988-12-05', 'Martinez', '2013-04-10', '2013-07-10', '2024-05-31', 'sophie.martinez@email.com', 'sophie.martinez@email.com', '567-890-1234', 'Villageville', 'Célibataire', 1, '2024-01-24 09:16:05', '2024-01-24 09:16:05', 4, 'Personnel Administratif', 'femme'),
(6, 'Browni', 'David', '1982-09-20', 'Brown', '2008-11-15', '2008-11-15', '2025-01-31', 'david.brown@email.com', 'david.brown@email.com', '23815331458', 'ville', 'Marié', 3, '2024-01-24 09:24:50', '2024-02-01 08:46:13', 10, 'Personnel Administratif', 'homme'),
(7, 'Lee', 'Amanda', '1993-05-18', 'Lee', '2017-08-03', '2017-08-03', '2025-08-28', 'amanda.lee@email.com', 'amanda.lee@email.com', '125522584', 'City', 'Marié', 1, '2024-01-24 09:24:50', '2024-01-24 09:24:50', 6, 'Enseignant', 'femme'),
(8, 'Miller', 'Alex', '1987-02-12', 'Miller', '2012-06-25', '2012-06-25', '2026-03-31', 'alex.miller@email.com', 'alex.miller@email.com', '266148696', 'tankville', 'Célibataire', 2, '2024-01-24 09:30:19', '2024-01-24 09:30:19', 3, 'Personnel Administratif', 'homme'),
(11, 'Garcia', 'Lily', '1989-04-03', 'Garcia', '2014-08-20', '2014-08-20', '2026-04-25', 'lily.garcia@email.com', 'lily.garcia@email.com', '551235848', 'TanVillage', 'Célibataire', 0, '2024-01-24 09:40:21', '2024-01-24 09:40:21', 5, 'Enseignant', 'femme'),
(12, 'Clark', 'Ryan', '1983-06-08', 'Clark', '2011-01-05', '2011-12-05', '2027-07-31', 'ryan.clark@email.com', 'ryan.clark@email.com', '236155455', 'CityCenter', 'Marié', 3, '2024-01-24 10:13:57', '2024-01-24 10:13:57', 2, 'Personnel Administratif', 'homme'),
(13, 'cani', 'zaaha', '2024-02-09', 'za777', '2024-02-24', '2024-02-02', '2037-02-05', 'titi@gmail.com', 'cani.z@gmail.com', '7888', 'yakro', 'mariée', 6, '2024-02-01 09:03:07', '2024-02-01 09:03:48', 14, NULL, NULL),
(14, 'tani', 'tani', '2024-01-30', 'tan256', '2024-02-02', '2024-01-31', '2024-03-01', 'tan@gmail.com', 'tani@gmail.com', '55655555', 'yakro', 'mariée', 4, '2024-02-01 10:26:46', '2024-02-01 10:27:28', 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `per_admins`
--

CREATE TABLE `per_admins` (
  `id_PerAdmin` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_service` int(10) UNSIGNED NOT NULL,
  `poste` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id_service` int(10) UNSIGNED NOT NULL,
  `TypeService` enum('RH','COMPTABILITE','SECRETARIAT','MEDICAL','HEBERGEMENT') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_d_r_h_s`
--

CREATE TABLE `user_d_r_h_s` (
  `id_UserDRH` int(10) UNSIGNED NOT NULL,
  `UserName` varchar(250) NOT NULL,
  `PasswordUser` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id_Abs`),
  ADD KEY `absences_id_perso_foreign` (`id_Perso`);

--
-- Index pour la table `dossiers`
--
ALTER TABLE `dossiers`
  ADD PRIMARY KEY (`id_dossier`),
  ADD KEY `dossiers_id_perso_foreign` (`id_Perso`);

--
-- Index pour la table `d_r_h_s`
--
ALTER TABLE `d_r_h_s`
  ADD PRIMARY KEY (`id_DRH`);

--
-- Index pour la table `ecoles`
--
ALTER TABLE `ecoles`
  ADD PRIMARY KEY (`id_ecole`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id_Ens`),
  ADD KEY `enseignants_id_ecole_foreign` (`id_ecole`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id_forma`);

--
-- Index pour la table `forma_pers`
--
ALTER TABLE `forma_pers`
  ADD PRIMARY KEY (`id_forma`,`id_Perso`),
  ADD KEY `forma_pers_id_perso_foreign` (`id_Perso`);

--
-- Index pour la table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id_Grade`);

--
-- Index pour la table `historiques`
--
ALTER TABLE `historiques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`id_Perso`),
  ADD KEY `personnes_id_grade_foreign` (`id_Grade`);

--
-- Index pour la table `per_admins`
--
ALTER TABLE `per_admins`
  ADD PRIMARY KEY (`id_PerAdmin`),
  ADD KEY `per_admins_id_service_foreign` (`id_service`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `user_d_r_h_s`
--
ALTER TABLE `user_d_r_h_s`
  ADD PRIMARY KEY (`id_UserDRH`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `absences`
--
ALTER TABLE `absences`
  MODIFY `id_Abs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `dossiers`
--
ALTER TABLE `dossiers`
  MODIFY `id_dossier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ecoles`
--
ALTER TABLE `ecoles`
  MODIFY `id_ecole` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `id_forma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `grades`
--
ALTER TABLE `grades`
  MODIFY `id_Grade` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `historiques`
--
ALTER TABLE `historiques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personnes`
--
ALTER TABLE `personnes`
  MODIFY `id_Perso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_id_perso_foreign` FOREIGN KEY (`id_Perso`) REFERENCES `personnes` (`id_Perso`);

--
-- Contraintes pour la table `dossiers`
--
ALTER TABLE `dossiers`
  ADD CONSTRAINT `dossiers_id_perso_foreign` FOREIGN KEY (`id_Perso`) REFERENCES `personnes` (`id_Perso`);

--
-- Contraintes pour la table `d_r_h_s`
--
ALTER TABLE `d_r_h_s`
  ADD CONSTRAINT `d_r_h_s_id_drh_foreign` FOREIGN KEY (`id_DRH`) REFERENCES `enseignants` (`id_Ens`);

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_id_ecole_foreign` FOREIGN KEY (`id_ecole`) REFERENCES `ecoles` (`id_ecole`),
  ADD CONSTRAINT `enseignants_id_ens_foreign` FOREIGN KEY (`id_Ens`) REFERENCES `personnes` (`id_Perso`);

--
-- Contraintes pour la table `forma_pers`
--
ALTER TABLE `forma_pers`
  ADD CONSTRAINT `forma_pers_id_forma_foreign` FOREIGN KEY (`id_forma`) REFERENCES `formations` (`id_forma`),
  ADD CONSTRAINT `forma_pers_id_perso_foreign` FOREIGN KEY (`id_Perso`) REFERENCES `personnes` (`id_Perso`);

--
-- Contraintes pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD CONSTRAINT `personnes_id_grade_foreign` FOREIGN KEY (`id_Grade`) REFERENCES `grades` (`id_Grade`);

--
-- Contraintes pour la table `per_admins`
--
ALTER TABLE `per_admins`
  ADD CONSTRAINT `per_admins_id_peradmin_foreign` FOREIGN KEY (`id_PerAdmin`) REFERENCES `personnes` (`id_Perso`),
  ADD CONSTRAINT `per_admins_id_service_foreign` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);

--
-- Contraintes pour la table `user_d_r_h_s`
--
ALTER TABLE `user_d_r_h_s`
  ADD CONSTRAINT `user_d_r_h_s_id_userdrh_foreign` FOREIGN KEY (`id_UserDRH`) REFERENCES `per_admins` (`id_PerAdmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
