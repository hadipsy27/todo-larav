-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 07, 2019 at 05:11 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todos_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_05_011339_create_todos_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `name`, `description`, `completed`, `created_at`, `updated_at`) VALUES
(1, 'Asperiores voluptates voluptatem.', 'Illum eum deleniti nobis necessitatibus occaecati perspiciatis quia. Animi veniam placeat distinctio voluptatem molestiae. Impedit veritatis laudantium corrupti ullam eum officiis. Quos in aut soluta velit maiores.', 0, '2019-08-04 20:12:52', '2019-08-07 08:05:24'),
(2, 'Eligendi aspernatur quis in.', 'Iure ea natus vel quo officiis architecto adipisci. Minus quia excepturi nesciunt officiis voluptatibus unde suscipit. Qui nisi aut porro eaque dolor et. Dolores vero quis quos ut enim molestias. Sed voluptatem quae ut minima. Alias omnis temporibus placeat a.', 0, '2019-08-04 20:12:52', '2019-08-07 07:59:43'),
(3, 'Beatae rerum numquam.', 'Quis aut sequi nihil soluta laboriosam. Vel deserunt vel libero minus et. Et esse dolorum voluptatem possimus. Aut quis quam laudantium aut et. Doloribus et maxime nostrum voluptatem ex odio. Minima aut et neque fugit error qui hic.', 1, '2019-08-04 20:12:52', '2019-08-07 07:59:38'),
(4, 'Aut dolores facere.', 'Quae laudantium sint non eligendi aut autem exercitationem. Consequuntur aut tenetur sit distinctio aut. Quis sint earum ullam qui similique soluta. Aut voluptatem numquam error ad quas mollitia. Quaerat eligendi laboriosam aut dolorum qui. Ad et voluptas est et aut id iste.', 0, '2019-08-04 20:12:52', '2019-08-07 07:59:40'),
(5, 'Fugiat quis inventore laborum ut.', 'Eum nemo fugiat quia. Ut nulla quas porro sed nesciunt qui aut nesciunt. Omnis sint officia magni nihil consequatur sint. Sunt sequi eveniet vitae quo magnam.', 1, '2019-08-04 20:12:52', '2019-08-07 07:59:41'),
(7, 'hadi prasetyo', 'This is Description', 1, '2019-08-06 20:07:51', '2019-08-07 07:59:36'),
(8, 'test xss', '<script>alert(123);</script>', 1, '2019-08-07 04:19:07', '2019-08-07 07:59:49'),
(13, 'ini nama saya', 'ini deskripsi saya', 0, '2019-08-07 07:44:32', '2019-08-07 08:03:05'),
(14, 'my name', 'my description', 0, '2019-08-07 07:44:55', '2019-08-07 07:44:55'),
(22, 'whats your name', 'whats your description', 0, '2019-08-07 08:09:25', '2019-08-07 08:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
