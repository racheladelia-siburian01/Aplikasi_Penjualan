-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2026 at 05:42 PM
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
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(11) NOT NULL,
  `nm_barang` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `harga_beli` int(50) NOT NULL,
  `harga_jual` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nm_barang`, `jenis`, `harga_beli`, `harga_jual`) VALUES
('AR002', 'Pulpen', 'ATK', 3500, 5000),
('AR003', 'Mouse', 'Elektronik', 55000, 65000),
('AR004', 'Keyboard', 'Elektronik', 1500000, 1800000),
('AR005', 'Pensil', 'ATK', 2000, 3500),
('AR006', 'Bembeng', 'Makanan', 2000, 2500),
('AR007', 'Cimory Milk', 'Minuman', 8000, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_nota`
--

CREATE TABLE `detail_nota` (
  `id_detail` int(11) NOT NULL,
  `idnota` varchar(10) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `nm_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_nota`
--

INSERT INTO `detail_nota` (`id_detail`, `idnota`, `kd_barang`, `nm_barang`, `harga`, `qty`, `subtotal`) VALUES
(1, 'IN0002', 'AR004', 'Keyboard', 1800000, 1, 1800000),
(2, 'IN0004', 'AR003', 'Mouse', 65000, 1, 65000),
(3, 'IN0004', 'AR007', 'Cimory Milk', 10000, 10, 100000),
(4, 'IN0005', 'AR006', 'Bembeng', 2500, 2, 5000),
(5, 'IN0006', 'AR005', 'Pensil', 3500, 10, 35000),
(6, 'IN0007', 'AR003', 'Mouse', 65000, 2, 130000),
(7, 'IN0008', 'AR005', 'Pensil', 3500, 10, 35000),
(8, 'IN0009', 'AR002', 'Pulpen', 5000, 50, 250000),
(9, 'IN0010', 'AR002', 'Pulpen', 5000, 5, 25000);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(11) NOT NULL,
  `nm_kasir` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `no_telepon` varchar(50) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nm_kasir`, `jenis_kelamin`, `no_telepon`, `agama`, `alamat`, `password`) VALUES
('RA001', 'Rachel Adelia Siburian', 'Perempuan', '089517122053', 'Kristen', 'Jawa Barat', 'rachel123');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `idnota` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `id_pelanggan` varchar(50) NOT NULL,
  `nm_pelanggan` varchar(50) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_kasir` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`idnota`, `tanggal`, `id_pelanggan`, `nm_pelanggan`, `total_bayar`, `id_kasir`) VALUES
('IN0001', '2026-06-16', 'CH002', 'RA001', 75000, ''),
('IN0002', '2026-06-16', 'CH002', 'RA001', 1865000, ''),
('IN0003', '2026-06-16', 'CH002', 'RA001', 55000, ''),
('IN0004', '2026-06-16', 'CH002', 'RA001', 165000, ''),
('IN0005', '2026-07-05', 'FD004', 'Fida', 5000, 'RA001'),
('IN0006', '2026-07-05', 'OP005', 'Oliv', 35000, 'RA001'),
('IN0007', '2026-07-05', 'OP005', 'Oliv', 130000, 'RA001'),
('IN0008', '2026-07-05', 'CH002', 'Chintya Putri Wardani', 35000, 'RA001'),
('IN0009', '2026-07-05', 'OP005', 'Oliv', 250000, 'RA001'),
('IN0010', '2026-07-06', 'RS001', 'Rachel Adelia Siburian', 25000, 'RA001');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` varchar(6) NOT NULL,
  `nmplg` varchar(25) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nmplg`, `jenis`, `telepon`, `alamat`) VALUES
('CH002', 'Chintya Putri Wardani', 'Perempuan', '088888888888', 'Jonggol'),
('DW003', 'Dwi Wahyuni', 'Perempuan', '099999999999', 'Bojong'),
('FD004', 'Fida', 'Perempuan', '089898989898', 'Ciracas'),
('OP005', 'Oliv', 'Perempuan', '09898989898989', 'Tapos'),
('RS001', 'Rachel Adelia Siburian', 'Perempuan', '089517121045', 'Cileungsi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `detail_nota`
--
ALTER TABLE `detail_nota`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_detailnota_01` (`idnota`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`idnota`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_nota`
--
ALTER TABLE `detail_nota`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_nota`
--
ALTER TABLE `detail_nota`
  ADD CONSTRAINT `fk_detailnota_01` FOREIGN KEY (`idnota`) REFERENCES `nota` (`idnota`),
  ADD CONSTRAINT `fk_nota` FOREIGN KEY (`idnota`) REFERENCES `nota` (`idnota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
