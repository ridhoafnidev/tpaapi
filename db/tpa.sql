-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2020 at 08:37 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `authkey` varchar(50) NOT NULL,
  `accesToken` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anak`
--

CREATE TABLE `anak` (
  `id_anak` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `ttl` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_akta_kelahiran` varchar(100) NOT NULL,
  `id_ortu` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `biaya`
--

CREATE TABLE `biaya` (
  `id_biaya` int(11) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `jenis_biaya` enum('Per Hari','Per Minggu','Per Bulan') NOT NULL,
  `jenis_penitipan` enum('Full Day','Half Day') NOT NULL,
  `rentang_umur` varchar(50) NOT NULL,
  `total_biaya` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_kegiatan`
--

CREATE TABLE `detail_kegiatan` (
  `id_detail_kegiatan` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_tpa`
--

CREATE TABLE `fasilitas_tpa` (
  `id_fasilitas_tpa` int(11) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `id_fasilitas` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ortu`
--

CREATE TABLE `ortu` (
  `id_ortu` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nomor_handphone` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `usia` varchar(50) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ortu`
--

INSERT INTO `ortu` (`id_ortu`, `nama_lengkap`, `email`, `password`, `alamat`, `nomor_handphone`, `pekerjaan`, `usia`, `agama`, `foto`, `token`, `createdAt`, `updatedAt`) VALUES
(1, 'ahmad', 'ahmad@gmai.com', '$2y$10$qX9MII0I7Ay42.Iv4EjjGOF.gapabrPUMytJl073DydALbXJ10Biy', 'pku', '082221', 'swasta', '30', 'islam', 'foto.jpg', 'D5mMjEvytgQY3OXAXNfq9xTy8fs2iWGwndcPdxesXbMt2J14mTvN75waYp07YP7TYisjdTdUSGvEusXc', '2020-01-18 16:12:26', '2020-01-18 16:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `ortu_tpa`
--

CREATE TABLE `ortu_tpa` (
  `id_ortu_tpa` int(11) NOT NULL,
  `id_ortu` int(11) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_ortu` int(11) NOT NULL,
  `nominal` varchar(50) NOT NULL,
  `bukti_pembayaran` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` enum('Belum Dibayar','Sudah Dibayar') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengelola`
--

CREATE TABLE `pengelola` (
  `id_pengelola` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nomor_handphone` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `usia` varchar(50) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tpa`
--

CREATE TABLE `tpa` (
  `id_tpa` int(11) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `nama_lokasi` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `foto_1` varchar(50) NOT NULL,
  `foto_2` varchar(50) NOT NULL,
  `foto_3` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` enum('Swasta','Negeri') NOT NULL,
  `id_pengelola` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id_anak`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- Indexes for table `biaya`
--
ALTER TABLE `biaya`
  ADD PRIMARY KEY (`id_biaya`),
  ADD KEY `npsn` (`npsn`);

--
-- Indexes for table `detail_kegiatan`
--
ALTER TABLE `detail_kegiatan`
  ADD PRIMARY KEY (`id_detail_kegiatan`),
  ADD KEY `id_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `fasilitas_tpa`
--
ALTER TABLE `fasilitas_tpa`
  ADD PRIMARY KEY (`id_fasilitas_tpa`),
  ADD KEY `npsn` (`npsn`),
  ADD KEY `id_fasilitas` (`id_fasilitas`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD KEY `npsn` (`npsn`);

--
-- Indexes for table `ortu`
--
ALTER TABLE `ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `ortu_tpa`
--
ALTER TABLE `ortu_tpa`
  ADD PRIMARY KEY (`id_ortu_tpa`),
  ADD KEY `id_ortu` (`id_ortu`),
  ADD KEY `npsn` (`npsn`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_ortu` (`id_ortu`);

--
-- Indexes for table `pengelola`
--
ALTER TABLE `pengelola`
  ADD PRIMARY KEY (`id_pengelola`);

--
-- Indexes for table `tpa`
--
ALTER TABLE `tpa`
  ADD PRIMARY KEY (`id_tpa`),
  ADD UNIQUE KEY `npsn` (`npsn`),
  ADD KEY `id_pengelola` (`id_pengelola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anak`
--
ALTER TABLE `anak`
  MODIFY `id_anak` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biaya`
--
ALTER TABLE `biaya`
  MODIFY `id_biaya` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_kegiatan`
--
ALTER TABLE `detail_kegiatan`
  MODIFY `id_detail_kegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas_tpa`
--
ALTER TABLE `fasilitas_tpa`
  MODIFY `id_fasilitas_tpa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ortu`
--
ALTER TABLE `ortu`
  MODIFY `id_ortu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ortu_tpa`
--
ALTER TABLE `ortu_tpa`
  MODIFY `id_ortu_tpa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengelola`
--
ALTER TABLE `pengelola`
  MODIFY `id_pengelola` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tpa`
--
ALTER TABLE `tpa`
  MODIFY `id_tpa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anak`
--
ALTER TABLE `anak`
  ADD CONSTRAINT `anak_ibfk_1` FOREIGN KEY (`id_ortu`) REFERENCES `ortu` (`id_ortu`);

--
-- Constraints for table `biaya`
--
ALTER TABLE `biaya`
  ADD CONSTRAINT `biaya_ibfk_1` FOREIGN KEY (`npsn`) REFERENCES `tpa` (`npsn`);

--
-- Constraints for table `detail_kegiatan`
--
ALTER TABLE `detail_kegiatan`
  ADD CONSTRAINT `detail_kegiatan_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`);

--
-- Constraints for table `fasilitas_tpa`
--
ALTER TABLE `fasilitas_tpa`
  ADD CONSTRAINT `fasilitas_tpa_ibfk_1` FOREIGN KEY (`npsn`) REFERENCES `tpa` (`npsn`),
  ADD CONSTRAINT `fasilitas_tpa_ibfk_2` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`);

--
-- Constraints for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`npsn`) REFERENCES `tpa` (`npsn`);

--
-- Constraints for table `ortu_tpa`
--
ALTER TABLE `ortu_tpa`
  ADD CONSTRAINT `ortu_tpa_ibfk_1` FOREIGN KEY (`id_ortu`) REFERENCES `ortu` (`id_ortu`),
  ADD CONSTRAINT `ortu_tpa_ibfk_2` FOREIGN KEY (`npsn`) REFERENCES `tpa` (`npsn`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_ortu`) REFERENCES `ortu` (`id_ortu`);

--
-- Constraints for table `tpa`
--
ALTER TABLE `tpa`
  ADD CONSTRAINT `tpa_ibfk_1` FOREIGN KEY (`id_pengelola`) REFERENCES `pengelola` (`id_pengelola`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
