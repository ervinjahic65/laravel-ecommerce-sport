-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 08:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-ecommerce-sport`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(3, 'Routes', 'Laravel routing', '2021-08-21 04:00:40', '2021-08-21 04:00:40'),
(4, 'controllers', 'Laravel controller is bridge between view and model', '2021-08-21 04:25:36', '2021-08-21 04:25:36'),
(5, 'Model', 'Laravel model deals with the database. class contains database related operations', '2021-08-21 04:26:19', '2021-08-21 04:26:19'),
(6, 'View', 'Views are html pages that are visible to users', '2021-08-21 04:26:57', '2021-08-21 04:26:57'),
(7, 'Middleware', 'Middware modify / filter the http request', '2021-08-21 04:28:46', '2021-08-21 04:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL,
  `datetime` datetime NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `size`, `color`, `datetime`, `quantity`) VALUES
(38, 13, 27, '4', 'black', '2023-06-18 16:06:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `product_id`, `color`) VALUES
(1, 15, 'red'),
(2, 15, 'blue'),
(3, 15, 'green'),
(4, 16, 'white'),
(5, 16, 'yellow'),
(6, 17, 'yellow'),
(7, 17, 'red'),
(8, 18, 'pink'),
(9, 18, 'red'),
(10, 19, 'Blue'),
(11, 20, 'white'),
(12, 20, 'blue'),
(13, 21, 'black'),
(14, 22, 'red'),
(15, 23, 'blue'),
(16, 24, 'blue'),
(17, 25, 'white'),
(18, 26, 'red'),
(19, 27, 'black'),
(20, 28, 'white'),
(21, 29, 'green'),
(22, 30, 'red'),
(23, 31, 'white'),
(24, 32, 'black'),
(25, 33, 'red');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_08_19_130024_create_questions_table', 2),
(4, '2021_08_20_095158_create_posts_table', 2),
(5, '2021_08_20_121425_create_articles_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('chsai.p13@gmail.com', '$2y$10$F9.Bc.Xn06W//9Ym1HQ/c.mYn0uaQrUzWu7KYVm7fZO2rPTA7FyZS', '2021-08-24 07:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `photo_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo_name`) VALUES
(6, 'apple-blue.jfif'),
(7, 'apple-red.jfif'),
(8, 'blue-shoe.jfif'),
(9, 'download (1).jfif'),
(10, 'lava.jpg'),
(26, 'apple-blue.jfif'),
(27, 'apple-blue.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `discount_price` double NOT NULL,
  `description` varchar(300) NOT NULL,
  `prod_img` text NOT NULL,
  `colors` varchar(300) DEFAULT NULL,
  `sizes` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `price`, `discount_price`, `description`, `prod_img`, `colors`, `sizes`) VALUES
(27, 'Jersey 78', 3, 100, 80, 'Jersey image', '1686678165.jpg', '', '4'),
(29, 'T-shirt', 5, 200, 160, 'Jersey image 3', '1686678315.jpg', 'green', '5'),
(30, 'Jersey 22', 4, 300, 260, 'Jersey image 4', '1686678376.jpg', '', '5'),
(31, 'Dortmund 22', 6, 250, 170, 'Jersey image 5', '1686678439.jpg', '', '3'),
(32, 'Jersey 17', 6, 400, 360, 'Jersey image 6', '1686678479.jpg', '', '7'),
(33, 'Jersey 78-2', 8, 500, 400, 'Jersey image 6', '1686678555.jpg', '', '7');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `prod_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `prod_image`) VALUES
(11, 8, '163238998049.jpg'),
(12, 8, '163238998066.jpg'),
(13, 8, '163238998027.png'),
(14, 8, '163238998078.jpg'),
(15, 9, '163239410614.jpg'),
(16, 9, '163239410639.jpg'),
(17, 9, '163239410661.jpg'),
(18, 10, '1632395320100.jpg'),
(19, 10, '163239532040.jpg'),
(20, 11, '163239578838.jpg'),
(21, 11, '163239578853.jpg'),
(22, 12, '163239701988.jpg'),
(23, 12, '163239701991.jpg'),
(24, 12, '163239701958.jpg'),
(25, 12, '163239701923.jpg'),
(26, 13, '163239765444.jpg'),
(27, 13, '163239765452.jpg'),
(28, 13, '163239765414.jpg'),
(29, 13, '163239765481.jpg'),
(30, 14, '163239781553.jpg'),
(31, 14, '163239781536.jpg'),
(32, 14, '163239781597.png'),
(33, 14, '163239781565.jpg'),
(34, 14, '163239781528.jpg'),
(35, 15, '163263987384.jpg'),
(36, 15, '163263987320.jpg'),
(37, 15, '16326398736.png'),
(38, 15, '16326398739.jpg'),
(39, 15, '163263987390.jpg'),
(40, 16, '163264078270.jpg'),
(41, 16, '16326407827.jpg'),
(42, 17, '163264089062.jpg'),
(43, 18, '163272113194.jpg'),
(44, 19, '163280657781.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_admin` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `is_admin`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(13, 1, 'Admin', 'admin@gmail.com', '$2y$10$eNj7jLqHcIIPQnfrNstAxu0fnRSC4voRGWWNnj3My8Bh48OcJVGpC', NULL, NULL, NULL),
(15, 0, 'test', 'test@mail.com', '$2y$10$L0lD9j32AZU6hh.r5K8Qr.NLp5DbPkW8BoHeSSbxCi5Mc3.DcNwjK', NULL, NULL, NULL),
(16, 0, 'test2', 'tes2@mail.com', '$2y$10$8tv2ffCViT.5lmnA0VaiyeNMpHI4fDvh4ejuVXafC5aLAnt8W3NdG', NULL, NULL, NULL),
(17, 0, 'User3', 'user@mail.com', '$2y$10$S6oEZTUbHRYSNIS8YQHZH.nys/pt7McOBBQXShlJEDvafd1hi5qxq', NULL, NULL, NULL),
(18, 0, 'User4', 'user4@mail.com', '$2y$10$FmNSZ0lZediqiLVSKhd6zu3FtLuNFfJvZ/ZTwWGYF4ImGvXj0LOTu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `product_id`, `user_id`) VALUES
(7, 16, 1),
(8, 15, 1),
(9, 15, 1),
(10, 15, 1),
(11, 15, 1),
(12, 15, 1),
(13, 16, 1),
(14, 17, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
