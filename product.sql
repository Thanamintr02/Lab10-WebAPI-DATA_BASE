-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 05:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptop_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(100) NOT NULL,
  `specification` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `brand`, `model`, `specification`, `price`, `stock`, `created_at`) VALUES
(1, 'Dell', 'Inspiron 16 Plus', 'Intel i9, RAM 32GB, SSD 1TB', 45900.00, 3, '2025-09-29 02:31:20'),
(2, 'Acer', 'Nitro 5 AN515', 'Intel Core i7, RAM 16GB, RTX 3060, SSD 1TB', 35900.00, 5, '2025-09-29 02:31:20'),
(3, 'MSI', 'GF63 Thin 11SC', 'Intel Core i5, RAM 8GB, GTX 1650, SSD 512GB', 23900.00, 6, '2025-09-29 02:31:20'),
(4, 'MSI', 'Prestige 14 Evo', 'Intel Core i7, RAM 16GB, SSD 1TB', 39900.00, 4, '2025-09-29 02:31:20'),
(5, 'Asus', 'ZenBook 14 OLED', 'AMD Ryzen 7, RAM 16GB, SSD 512GB', 32900.00, 7, '2025-09-29 02:31:20'),
(6, 'Asus', 'ROG Strix G16', 'Intel Core i9, RAM 32GB, RTX 4070, SSD 1TB', 69900.00, 2, '2025-09-29 02:31:20'),
(7, 'HP', 'Envy x360 13', 'AMD Ryzen 5, RAM 8GB, SSD 512GB', 26900.00, 10, '2025-09-29 02:31:20'),
(8, 'HP', 'OMEN 16', 'Intel Core i7, RAM 16GB, RTX 3060, SSD 1TB', 45900.00, 3, '2025-09-29 02:31:20'),
(9, 'Dell', 'XPS 13 Plus', 'Intel Core i7, RAM 16GB, SSD 1TB', 52900.00, 2, '2025-09-29 02:31:20'),
(10, 'Dell', 'G15 Gaming', 'AMD Ryzen 7, RAM 16GB, RTX 3050 Ti, SSD 512GB', 33900.00, 6, '2025-09-29 02:31:20'),
(11, 'Lenovo', 'IdeaPad Slim 5', 'AMD Ryzen 5, RAM 16GB, SSD 512GB', 21900.00, 9, '2025-09-29 02:31:20'),
(12, 'Lenovo', 'Legion 5 Pro', 'AMD Ryzen 7, RAM 16GB, RTX 3070, SSD 1TB', 49900.00, 4, '2025-09-29 02:31:20'),
(13, 'Samsung', 'Galaxy Book3 Pro', 'Intel Core i7, RAM 16GB, SSD 1TB', 47900.00, 3, '2025-09-29 02:31:20'),
(14, 'Samsung', 'Galaxy Book2 360', 'Intel Core i5, RAM 8GB, SSD 512GB', 29900.00, 5, '2025-09-29 02:31:20'),
(15, 'Microsoft', 'Surface Laptop 5', 'Intel Core i7, RAM 16GB, SSD 512GB', 49900.00, 2, '2025-09-29 02:31:20'),
(16, 'Microsoft', 'Surface Pro 9', 'Intel Core i5, RAM 8GB, SSD 256GB', 37900.00, 6, '2025-09-29 02:31:20'),
(17, 'Apple', 'MacBook Pro 14 M2 Pro', 'Apple M2 Pro Chip, RAM 16GB, SSD 1TB', 74900.00, 3, '2025-09-29 02:31:20'),
(18, 'Apple', 'MacBook Pro 16 M2 Max', 'Apple M2 Max Chip, RAM 32GB, SSD 1TB', 99900.00, 1, '2025-09-29 02:31:20'),
(19, 'Huawei', 'MateBook D14', 'Intel Core i5, RAM 8GB, SSD 512GB', 19900.00, 8, '2025-09-29 02:31:20'),
(20, 'Huawei', 'MateBook X Pro', 'Intel Core i7, RAM 16GB, SSD 1TB', 49900.00, 2, '2025-09-29 02:31:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
