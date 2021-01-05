-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 04:19 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `iddsn` int(11) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jk` enum('L','P') NOT NULL DEFAULT 'L',
  `email` varchar(255) NOT NULL,
  `telpon` varchar(255) NOT NULL,
  `kode_fakultas` varchar(10) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`iddsn`, `nidn`, `nama_lengkap`, `jk`, `email`, `telpon`, `kode_fakultas`, `kode_prodi`, `passwd`) VALUES
(1, '0412068601', 'Johan, M.T', 'L', 'ahmad.zaenudin@umc.ac.id', '08657664654653', 'FT', 'TI', '202cb962ac59075b964b07152d234b70'),
(2, '0403048501', 'Arie Utami S, M.T', 'P', 'arie.utami@umc.ac.id', '08656546533211', 'FT', 'TI', '202cb962ac59075b964b07152d234b70'),
(3, '0411088701', 'H. Bastoni, M.T', 'L', 'bastoni@umc.ac.id', '08345678987622', 'FT', 'PET', '202cb962ac59075b964b07152d234b70'),
(4, '0402057307', 'Freddy Wicaksono, M.Kom', 'L', 'freddy.wicaksono@umc.ac.id', '089567345622', 'FT', 'TIF', '202cb962ac59075b964b07152d234b70'),
(5, '0415028822', 'Dian Novianti, M.Kom', 'P', 'dian.novianti@umc.ac.id', '0823456789855', 'FT', 'TIF', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `idfk` int(11) NOT NULL,
  `kode_fakultas` varchar(10) NOT NULL,
  `nama_fakultas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`idfk`, `kode_fakultas`, `nama_fakultas`) VALUES
(1, 'FT', 'Fakultas Teknik');

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `idkrs` int(11) NOT NULL,
  `nomor_bukti` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `nim` varchar(20) NOT NULL,
  `jenis_semester` varchar(10) NOT NULL,
  `tahun_akademik` varchar(20) NOT NULL,
  `semester` int(11) NOT NULL,
  `nidn` varchar(20) NOT NULL,
  `indeks_prestasi` float NOT NULL DEFAULT 0,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `krsdetail`
--

CREATE TABLE `krsdetail` (
  `iddetail` int(11) NOT NULL,
  `nomor_bukti` varchar(255) NOT NULL,
  `kodemk` varchar(20) NOT NULL,
  `sks` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `nilai_khd` float NOT NULL,
  `nilai_tgs` float NOT NULL,
  `nilai_uts` decimal(10,0) NOT NULL,
  `nilai_uas` float NOT NULL,
  `nilai_akhir` float NOT NULL,
  `nilai_mutu` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `idmhs` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jk` enum('L','P') NOT NULL DEFAULT 'L',
  `tanggal_lahir` date NOT NULL,
  `kode_fakultas` varchar(10) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nidn_dosenwali` varchar(10) DEFAULT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`idmhs`, `nim`, `nama_lengkap`, `jk`, `tanggal_lahir`, `kode_fakultas`, `kode_prodi`, `nidn_dosenwali`, `passwd`) VALUES
(1, '2017101040', 'Tomi Sumantri', 'L', '2000-01-04', 'FT', 'TI', '0412068601', '202cb962ac59075b964b07152d234b70'),
(2, '2017202045', 'Ria Fawziyah', 'P', '2000-04-14', 'FT', 'TIF', '0402057307', '202cb962ac59075b964b07152d234b70'),
(3, '2017404098', 'Tito Sumarsono', 'L', '2000-01-12', 'FT', 'PET', '0411088701', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `idmk` int(11) NOT NULL,
  `kodemk` varchar(20) NOT NULL,
  `namamk` varchar(255) NOT NULL,
  `sks` int(11) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`idmk`, `kodemk`, `namamk`, `sks`, `kode_prodi`) VALUES
(1, '1034', 'Kewirausahaan Islami', 3, 'TI'),
(2, '1040', 'KKM', 4, 'TI'),
(3, '1055', 'PKL', 4, 'TI'),
(4, '1066', 'Agama Islam', 2, 'TI'),
(5, '1077', 'Kalkulus', 2, 'TI'),
(6, '2011', 'Matematika Diskrit', 2, 'TIF'),
(7, '2012', 'Statistika', 2, 'TIF'),
(8, '2013', 'Logika Matematika', 2, 'TIF'),
(9, '2014', 'Pemrograman Visual', 3, 'TIF'),
(10, '2015', 'Basis Data Lanjutan', 3, 'TIF'),
(11, '3011', 'Teknik Beternak', 2, 'PET'),
(12, '3012', 'Makanan Hewan', 2, 'PET'),
(13, '3033', 'Penyakit Hewan', 2, 'PET'),
(14, '3035', 'KKM', 4, 'PET'),
(15, '3077', 'PKL', 4, 'PET');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `idprodi` int(11) NOT NULL,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `kode_fakultas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`idprodi`, `kode_prodi`, `nama_prodi`, `kode_fakultas`) VALUES
(1, 'TI', 'Teknik Industri', 'FT'),
(2, 'TIF', 'Teknik Informatika', 'FT'),
(3, 'PET', 'Peternakan', 'FT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `username`, `nama_lengkap`, `passwd`) VALUES
(1, 'admin', 'Admin', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`iddsn`),
  ADD UNIQUE KEY `nidn` (`nidn`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`idfk`),
  ADD UNIQUE KEY `kode_fakultas` (`kode_fakultas`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`idkrs`),
  ADD UNIQUE KEY `nomor_bukti` (`nomor_bukti`);

--
-- Indexes for table `krsdetail`
--
ALTER TABLE `krsdetail`
  ADD PRIMARY KEY (`iddetail`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`idmhs`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`idmk`),
  ADD UNIQUE KEY `kodemk` (`kodemk`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`idprodi`),
  ADD UNIQUE KEY `kode_prodi` (`kode_prodi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `iddsn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `idfk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `idkrs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krsdetail`
--
ALTER TABLE `krsdetail`
  MODIFY `iddetail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `idmhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `idmk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `idprodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
