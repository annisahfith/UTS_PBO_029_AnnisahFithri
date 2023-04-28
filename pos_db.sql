-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 05:11 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(255) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `harga`) VALUES
(1111, 'Chitato', 10000),
(1112, 'Oreo', 15000),
(1113, 'Chiki', 12000),
(1114, 'Potabee', 8000),
(1115, 'Twister', 6000),
(1116, 'Tango', 8000),
(1117, 'Monde', 14000),
(1118, 'Kacang Garuda', 4000),
(1119, 'Vitamin c', 10000),
(1120, 'Aqua', 5000),
(1121, 'Pocky', 8000),
(1122, 'Yupi', 6000),
(1123, 'Sari Roti', 6000),
(1124, 'Popcorn', 8000),
(1125, 'Goodtime', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `datatransaksi`
--

CREATE TABLE `datatransaksi` (
  `id_datatransaksi` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `kuantitas` int(11) DEFAULT NULL,
  `harga` float DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datatransaksi`
--

INSERT INTO `datatransaksi` (`id_datatransaksi`, `id_transaksi`, `kuantitas`, `harga`, `id_item`) VALUES
(1, 518475, 1, 15000, 1112),
(2, 263097, 1, 15000, 1112),
(3, 983103, 1, 10000, 1111),
(4, 653305, 4, 40000, 1111),
(5, 927437, 1, 10000, 1111),
(6, 927437, 1, 15000, 1112),
(7, 927437, 1, 12000, 1113),
(8, 927437, 1, 8000, 1114);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `waktu_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_harga` float DEFAULT NULL,
  `total_bayar` float DEFAULT NULL,
  `kembalian` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `waktu_transaksi`, `total_harga`, `total_bayar`, `kembalian`) VALUES
(263097, '2023-04-26 18:52:28', 15000, 30000, 15000),
(518475, '2023-04-26 18:52:26', 15000, 30000, 15000),
(653305, '2023-04-26 21:06:44', 40000, 50000, 10000),
(927437, '2023-04-27 03:10:51', 45000, 50000, 5000),
(983103, '2023-04-26 18:54:31', 10000, 20000, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datatransaksi`
--
ALTER TABLE `datatransaksi`
  ADD PRIMARY KEY (`id_datatransaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_item` (`id_item`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1126;

--
-- AUTO_INCREMENT for table `datatransaksi`
--
ALTER TABLE `datatransaksi`
  MODIFY `id_datatransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datatransaksi`
--
ALTER TABLE `datatransaksi`
  ADD CONSTRAINT `datatransaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `datatransaksi_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
