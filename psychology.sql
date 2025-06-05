-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 04:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psychology`
--

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `is_active`, `name`, `created_at`, `updated_at`) VALUES
(3, 0, 'Test', '2023-04-18 19:01:01', '2023-04-24 16:40:13'),
(5, 1, 'First Exam', '2023-04-18 19:01:16', '2023-04-24 16:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `exam_levels`
--

CREATE TABLE `exam_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_levels`
--

INSERT INTO `exam_levels` (`id`, `exam_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 5, 'First Level', '2023-04-18 19:26:20', '2023-04-20 16:39:09'),
(3, 5, 'Second Level', '2023-04-20 17:33:38', '2023-04-20 17:33:38'),
(4, 5, 'Final Level', '2023-04-20 17:36:29', '2023-04-20 17:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_level_id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `exam_level_id`, `question`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tap the card with the same number of elements and the same color as the bottom card.', '2023-04-20 16:52:54', '2023-04-20 16:52:54'),
(2, 1, 'Touch the card with the same number of elements and the same shape as the bottom card.', '2023-04-20 17:30:34', '2023-04-20 17:30:54'),
(3, 3, 'Tap the card that doesn\'t have the same number of elements as the bottom card', '2023-04-20 17:33:55', '2023-04-20 17:33:55'),
(4, 4, 'Touch the card that has neither the same number of elements nor the same color as the cards below', '2023-04-20 17:36:35', '2023-04-20 17:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_items`
--

CREATE TABLE `exam_question_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_question_id` bigint(20) UNSIGNED NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `shape` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_question_items`
--

INSERT INTO `exam_question_items` (`id`, `exam_question_id`, `correct`, `image`, `color`, `shape`, `count`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'uploads/questions/items/PXlKwS3WyaJ77FtuAY5A60BIMNFRtdubcHn9Su7W.png', 'yellow', 'banana', '5', '2023-04-20 17:19:48', '2023-04-20 17:22:32'),
(2, 1, 0, 'uploads/questions/items/p2PkidIKVm1g6TBv60IOV5PZTDAdvUQjMtbR7IBP.png', 'red', 'square', '2', '2023-04-20 17:22:53', '2023-04-20 17:22:56'),
(4, 1, 0, 'uploads/questions/items/o6MBCOonbGLOWrFbcIioNJA6uOPRbzLifm6qq86K.png', 'blue', 'circle', '2', '2023-04-20 17:23:50', '2023-04-20 17:23:50'),
(5, 2, 0, 'uploads/questions/items/2rSlFZ3dQdCXoQUKaEMNMCSQ3V4p2oQErYBAXUpg.png', 'violet', 'square', '2', '2023-04-20 17:31:40', '2023-04-20 17:31:40'),
(6, 2, 0, 'uploads/questions/items/nB1d4ulAoazMJSuLS4ugV5ifn9Wy3ugmuoCADrCV.png', 'gray', 'circle', '4', '2023-04-20 17:31:56', '2023-04-24 16:44:44'),
(7, 2, 1, 'uploads/questions/items/y0kGsi8lHVQ6NvairHMYGQaJHptiqpRt6njG5IqV.png', 'yellow', 'banana', '2', '2023-04-20 17:32:27', '2023-04-24 16:44:45'),
(8, 3, 0, 'uploads/questions/items/g7P8GVlMLSx594Pu8wxbgHNzv9LQn8ZwHCb5pbIp.png', 'red', 'banana', '2', '2023-04-20 17:34:41', '2023-04-20 17:34:41'),
(9, 3, 1, 'uploads/questions/items/onkG0S97TTGQbLrp9Cw2hEB81vj4HLirmVxOLX93.png', 'violet', 'triangle', '5', '2023-04-20 17:35:10', '2023-04-20 17:36:20'),
(10, 4, 0, 'uploads/questions/items/tBmZdZUtfopxVTyhQyqVVxCqcwgfpmHJTEuRLO0J.png', 'yellow', 'hexagon', '1', '2023-04-20 17:37:36', '2023-04-20 17:37:36'),
(11, 4, 1, 'uploads/questions/items/WGRsNBDvsb56600WfZGxbP6N5fa6bVmv49tnktMm.png', 'red', 'triangle', '3', '2023-04-20 17:37:48', '2023-04-20 17:41:24'),
(12, 4, 0, 'uploads/questions/items/5gDpXbJxwQKxIgjVA4pDqWh5J87fABiniiGrIX9S.png', 'yellow', 'hexagon', '4', '2023-04-20 17:39:05', '2023-04-20 17:39:05'),
(13, 4, 0, 'uploads/questions/items/cCe5LbFopgF84zUpmISo1oGoRnFNQnq29jlAHnd3.png', 'red', 'hexagon', '3', '2023-04-20 17:39:40', '2023-04-20 17:39:40'),
(14, 4, 0, 'uploads/questions/items/r6BhyDaT2M7UjyY8yEi87TKTAU4hOh3z14akG77Y.png', 'blue', 'banana', '3', '2023-04-20 17:40:18', '2023-04-20 17:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_options`
--

CREATE TABLE `exam_question_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_question_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `shape` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_question_options`
--

INSERT INTO `exam_question_options` (`id`, `exam_question_id`, `image`, `color`, `shape`, `count`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/questions/items/K3ZY6izVsYdGE6XxN541EB45xuCJqns9drUQd0Ef.png', 'blue', 'jesus', '2', '2023-04-20 17:29:52', '2023-04-20 17:29:52'),
(2, 2, 'uploads/questions/items/RDPgpsLehFda2icw7CIlfcxeozMQZsHz7gny9c7v.png', 'blue', 'circle', '2', '2023-04-20 17:32:55', '2023-04-20 17:32:55'),
(3, 3, 'uploads/questions/items/k8HkSVozR9oaF0qmUKwKVREAbMNtvfaU1ax25Qxk.png', 'gray', 'triangle', '2', '2023-04-20 17:35:27', '2023-04-20 17:35:27'),
(4, 4, 'uploads/questions/options/9mYQ7OrpXmDRz3XAdb0e6JIjKIM99PYxTmXT5yUG.png', 'gray', 'banana', '2', '2023-04-20 17:41:01', '2023-04-20 17:41:01'),
(5, 4, 'uploads/questions/options/WkbpoqX1CH51u36nBCoSwrfm4sTIWJcQorLgiFgF.png', 'blue', 'banana', '5', '2023-04-20 17:41:14', '2023-04-20 17:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_25_124058_create_permission_tables', 1),
(6, '2023_04_18_172216_create_settings_table', 1),
(7, '2023_04_18_231741_create_exams_table', 2),
(8, '2023_04_18_233442_create_exam_levels_table', 3),
(11, '2023_04_20_130527_create_exam_questions_table', 4),
(12, '2023_04_20_211341_create_exam_question_items_table', 5),
(13, '2023_04_20_212948_create_exam_question_options_table', 6),
(14, '2023_04_21_204428_create_results_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 6),
(7, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 6),
(8, 'App\\Models\\User', 1),
(8, 'App\\Models\\User', 6),
(9, 'App\\Models\\User', 1),
(9, 'App\\Models\\User', 5),
(9, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(4, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage_settings', 'web', '2023-04-18 17:22:12', '2023-04-18 17:22:12'),
(2, 'manage_roles', 'web', '2023-04-18 17:22:12', '2023-04-18 17:22:12'),
(3, 'manage_users', 'web', '2023-04-18 17:56:34', '2023-04-18 17:56:34'),
(4, 'manage_exams', 'web', '2023-04-18 18:55:59', '2023-04-18 18:55:59'),
(5, 'manage_exam_levels', 'web', '2023-04-18 19:07:48', '2023-04-18 19:07:48'),
(6, 'manage_exam_questions', 'web', '2023-04-20 08:54:24', '2023-04-20 08:54:24'),
(7, 'manage_exam_question_items', 'web', '2023-04-20 17:08:33', '2023-04-20 17:08:33'),
(8, 'manage_exam_question_options', 'web', '2023-04-20 17:08:34', '2023-04-20 17:08:34'),
(9, 'manage_results', 'web', '2023-04-21 16:47:19', '2023-04-21 16:47:19');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `birth_date` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `exam_id`, `first_name`, `last_name`, `birth_date`, `gender`, `email`, `address`, `created_at`, `updated_at`) VALUES
(5, 5, 'Alireza', 'Mohammadi', '2023-04-03', 'male', 'alirezaa80m@gmail.com', 'adwd', '2023-04-21 19:44:33', '2023-04-21 19:44:33'),
(8, 5, 'Adulf', 'Hitler', '2023-12-25', 'male', 'a@a.com', 'fbgrbrt', '2023-04-24 16:48:09', '2023-04-24 16:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `result_answers`
--

CREATE TABLE `result_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_id` bigint(20) UNSIGNED NOT NULL,
  `exam_question_id` bigint(20) UNSIGNED NOT NULL,
  `first_exam_question_item_id` bigint(20) UNSIGNED NOT NULL,
  `first_select_time` timestamp NULL DEFAULT NULL,
  `last_exam_question_item_id` bigint(20) UNSIGNED NOT NULL,
  `last_select_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `result_answers`
--

INSERT INTO `result_answers` (`id`, `result_id`, `exam_question_id`, `first_exam_question_item_id`, `first_select_time`, `last_exam_question_item_id`, `last_select_time`, `created_at`, `updated_at`) VALUES
(9, 5, 1, 4, '2023-04-21 19:44:23', 1, '2023-04-21 19:44:24', '2023-04-21 19:44:33', '2023-04-21 19:44:33'),
(10, 5, 2, 6, '2023-04-21 19:44:26', 6, '2023-04-21 19:44:26', '2023-04-21 19:44:33', '2023-04-21 19:44:33'),
(11, 5, 3, 8, '2023-04-21 19:44:28', 9, '2023-04-21 19:44:29', '2023-04-21 19:44:33', '2023-04-21 19:44:33'),
(12, 5, 4, 12, '2023-04-21 19:44:31', 14, '2023-04-21 19:44:32', '2023-04-21 19:44:33', '2023-04-21 19:44:33'),
(21, 8, 1, 4, '2023-04-24 16:47:24', 1, '2023-04-24 16:47:29', '2023-04-24 16:48:09', '2023-04-24 16:48:09'),
(22, 8, 2, 6, '2023-04-24 16:47:34', 6, '2023-04-24 16:47:34', '2023-04-24 16:48:09', '2023-04-24 16:48:09'),
(23, 8, 3, 9, '2023-04-24 16:47:43', 9, '2023-04-24 16:47:43', '2023-04-24 16:48:09', '2023-04-24 16:48:09'),
(24, 8, 4, 11, '2023-04-24 16:48:04', 11, '2023-04-24 16:48:04', '2023-04-24 16:48:10', '2023-04-24 16:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'Test', 'web', '2023-04-18 17:33:26', '2023-04-18 17:33:26'),
(7, 'Doctor', 'web', '2023-04-21 19:40:27', '2023-04-21 19:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 4),
(2, 4),
(9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'Psychology', '2023-04-18 13:08:33', '2023-04-18 13:08:33'),
(2, 'site_description', 'Psychology Description', '2023-04-18 13:08:33', '2023-04-18 13:08:33'),
(3, 'site_fav', 'uploads/settings/9qksOeu7HTDAijcmQPffPMN5CYWF8Gb62n4Orj0x.png', '2023-04-18 13:08:33', '2023-04-18 16:18:54'),
(5, 'done_msg', 'Thank You, See You Soon.', '2023-04-21 16:28:01', '2023-04-21 16:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Alireza Mohammadi', 'programmer@the6fallenangels.com', '$2y$10$KcXu4uU5in5vctiaiub8OOHJzFsl7AhTbo26e2GEzwenKfjI0gVw2', NULL, '2023-04-18 15:33:53', '2023-04-18 15:33:53'),
(2, 'Test', 'test@ta.com', '$2y$10$fSqg49C71s6XdHIB8UCAXusB3/xynWAfFQ0WhuUaWp17/GPwCrBpW', NULL, '2023-04-18 17:47:53', '2023-04-18 17:53:54'),
(5, 'Doctor', 'doctor@doctor.com', '$2y$10$YFblEudibTCzqe8G0VewG.Hy5VcDnLWWEGmZCxY/aDaDEML4kpeD6', NULL, '2023-04-21 19:40:52', '2023-04-21 19:40:52'),
(6, 'Hesam', 'admin@admin.com', '$2y$10$KcXu4uU5in5vctiaiub8OOHJzFsl7AhTbo26e2GEzwenKfjI0gVw2', NULL, '2023-04-18 15:33:53', '2023-04-18 15:33:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_levels`
--
ALTER TABLE `exam_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_levels_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_questions_exam_level_id_foreign` (`exam_level_id`);

--
-- Indexes for table `exam_question_items`
--
ALTER TABLE `exam_question_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_question_items_exam_question_id_foreign` (`exam_question_id`);

--
-- Indexes for table `exam_question_options`
--
ALTER TABLE `exam_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_question_options_exam_question_id_foreign` (`exam_question_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `result_answers`
--
ALTER TABLE `result_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_answers_result_id_foreign` (`result_id`),
  ADD KEY `result_answers_exam_question_id_foreign` (`exam_question_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_levels`
--
ALTER TABLE `exam_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_question_items`
--
ALTER TABLE `exam_question_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `exam_question_options`
--
ALTER TABLE `exam_question_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `result_answers`
--
ALTER TABLE `result_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam_levels`
--
ALTER TABLE `exam_levels`
  ADD CONSTRAINT `exam_levels_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `exam_questions_exam_level_id_foreign` FOREIGN KEY (`exam_level_id`) REFERENCES `exam_levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_question_items`
--
ALTER TABLE `exam_question_items`
  ADD CONSTRAINT `exam_question_items_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_question_options`
--
ALTER TABLE `exam_question_options`
  ADD CONSTRAINT `exam_question_options_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `result_answers`
--
ALTER TABLE `result_answers`
  ADD CONSTRAINT `result_answers_exam_question_id_foreign` FOREIGN KEY (`exam_question_id`) REFERENCES `exam_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `result_answers_result_id_foreign` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
