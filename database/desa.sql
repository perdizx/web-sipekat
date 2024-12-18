-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 11:00 PM
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
-- Database: `desa`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_masyarakat`
--

CREATE TABLE `data_masyarakat` (
  `id_masarakat` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nik` char(16) NOT NULL,
  `alamat` text NOT NULL,
  `rt_rw` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masarakat`
--

CREATE TABLE `masarakat` (
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `rt_rw` varchar(20) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `masarakat`
--

INSERT INTO `masarakat` (`nik`, `nama`, `alamat`, `rt_rw`, `username`, `password`, `tlp`) VALUES
('1234567890123456', 'perdi', 'pangakaran', '03/01', 'perdi', '123456', '082211836567'),
('4337857201230038', 'defta', 'cilamaya', '03/01', 'defta', '123456', '0812345678'),
('4337857201230029', 'Nivia Ayu Andini Asih', 'Cipucuk', '06/08', 'niviayuu', '12345678', '081292200689'),
('4337857201230022', 'Peter Parker', 'Los Angeles, California', '009/007', 'peter', 'peter123', '081212121212');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` varchar(40) NOT NULL,
  `nama_pengadu` varchar(40) NOT NULL,
  `nik` char(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tlp` varchar(13) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('Proses','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nama_pengadu`, `nik`, `isi_laporan`, `tlp`, `foto`, `status`) VALUES
(1, '2024-11-11 (22:32:55)', 'defta', '4337857201230038', 'ada banjir dikosan ungu', '0812345678', 'update backlog 1.JPG', 'Selesai'),
(2, '2024-11-13 (20:17:52)', 'Nivia Ayu Andini Asih', '4337857201230029', 'disini ada kebakaran', '081292200689', 'BOY.png', 'Selesai'),
(3, '2024-11-14 (08:59:37)', 'Peter Parker', '4337857201230022', 'Benerin sinyal nya', '081212121212', 'antoine-rault-IhWRrZx4-kk-unsplash.jpg', 'Selesai'),
(4, '2024-11-14 (12:02:04)', 'Nivia Ayu Andini Asih', '4337857201230029', 'kebakaran', '081292200689', 'BOY.png', 'Proses'),
(5, '2024-12-14 (11:00:46)', 'perdi', '1234567890123456', 'ada kebakaran', '082211836567', '1.png', 'Selesai'),
(6, '2024-12-14 (11:28:46)', 'perdi', '1234567890123456', 'ada kemalingan', '082211836567', '3.png', 'Proses'),
(7, '2024-12-14 (11:41:02)', 'perdi', '1234567890123456', 'saya ilang hatinya dicuri aisyah', '082211836567', '1.png', 'Selesai'),
(8, '2024-12-14 (11:47:06)', 'perdi', '1234567890123456', 'kotoran di selokan', '082211836567', '1.png', 'Selesai'),
(9, '2024-12-14 (11:53:56)', 'perdi', '1234567890123456', 'dbgdg', '082211836567', '4.png', 'Selesai'),
(10, '2024-12-14 (11:58:54)', 'perdi', '1234567890123456', 'ada kebakaran', '082211836567', '2.png', 'Proses');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tlp` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `tlp`, `level`) VALUES
(1, 'perdixz', 'perdi', '123456', '081234567891', 'admin'),
(2, 'Ginartriadi', 'admin', 'admin', '085712345472', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` varchar(40) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `isi_laporan`, `tanggapan`, `id_petugas`) VALUES
(1, 1, '2024-11-11 (22:38:36)', 'ada banjir dikosan ungu', 'baik saya otw', 1),
(2, 2, '2024-11-13 (20:19:47)', 'disini ada kebakaran', 'oke baik,damkar 5 menit lagi segera ketempat lokasi. silahkan ditunggu:)', 1),
(3, 3, '2024-11-14 (09:00:55)', 'Benerin sinyal nya', 'siappp', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_masyarakat`
--
ALTER TABLE `data_masyarakat`
  ADD PRIMARY KEY (`id_masarakat`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_masyarakat`
--
ALTER TABLE `data_masyarakat`
  MODIFY `id_masarakat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
