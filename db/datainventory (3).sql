-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Agu 2023 pada 16.14
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datainventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` varchar(50) NOT NULL,
  `jenis_brg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `jenis_brg`) VALUES
('1', 'MATERIAL'),
('2', 'ASSET'),
('3', 'OBAT'),
('4', 'PAKAN'),
('5', 'AYAM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masuk`
--

CREATE TABLE `masuk` (
  `id_masuk` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `Staff_Gudang` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `masuk`
--

INSERT INTO `masuk` (`id_masuk`, `unit`, `Staff_Gudang`, `kode_brg`, `id_jenis`, `jumlah`, `satuan`, `tgl_masuk`, `status`) VALUES
(1, 'melia', '', '420.06.1062', 2, 2, 'Unit', '2023-08-02', 0),
(2, 'melia', '', '110.01.0776', 1, 2, 'PC', '2023-08-02', 0),
(3, 'melia', '', 'EID50', 1, 4, 'PC', '2023-08-02', 0),
(4, 'melia', '', '110.01.0776', 1, 2, 'PC', '2023-08-04', 0),
(5, 'melia', '', '110.01.0776', 1, 2, 'PC', '2023-08-05', 0),
(6, 'melia', '', '110.01.0776', 1, 2, 'PC', '2023-08-05', 0),
(7, 'melia', '', '420.06.1062', 2, 5, 'Unit', '2023-08-05', 0),
(8, 'melia', '', '110.01.0776', 1, 1, 'PC', '2023-08-05', 0),
(9, 'melia', '', 'VL15810', 3, 1, 'VIAL', '2023-08-06', 0),
(10, 'melia', '', '25884666', 1, 1, 'PC', '2023-08-06', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `masuk_sementara`
--

CREATE TABLE `masuk_sementara` (
  `id_masuk_sementara` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `Staff_Gudang` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id` int(11) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemasukan`
--

INSERT INTO `pemasukan` (`id`, `unit`, `kode_brg`, `jumlah`, `tgl_masuk`, `gambar`) VALUES
(38, 'Fahrianur', '110.01.0776', 3, '2023-08-01', ''),
(39, 'Fahrianur', '110.01.0776', 3, '2023-08-01', ''),
(40, 'Fahrianur', '110.01.0776', 3, '2023-08-01', ''),
(41, 'Fahrianur', '110.01.0776', 3, '2023-08-01', ''),
(42, 'Fahrianur', '110.01.0776', 2, '2023-08-01', ''),
(43, 'Fahrianur', '110.01.0776', 2, '2023-08-01', ''),
(44, 'Fahrianur', '110.01.0776', 3, '2023-08-02', ''),
(45, 'Fahrianur', '110.01.0776', 3, '2023-08-02', ''),
(46, 'Fahrianur', '110.01.0776', 7, '2023-08-02', ''),
(47, 'Fahrianur', '110.01.0776', 7, '2023-08-02', ''),
(48, 'Fahrianur', '110.01.0776', 5, '2023-08-02', ''),
(49, 'Fahrianur', '110.01.0776', 3, '2023-08-02', ''),
(50, 'Fahrianur', '420.06.1062', 3, '2023-08-02', ''),
(51, 'Fahrianur', '110.01.0776', 1, '2023-08-02', ''),
(52, 'Fahrianur', '25884666', 2, '2023-08-03', ''),
(53, 'Fahrianur', '420.06.1062', 1, '2023-08-04', ''),
(54, 'Fahrianur', 'VL15810', 5, '2023-08-04', ''),
(55, 'Fahrianur', '110.01.0776', 2, '2023-08-05', ''),
(56, 'Fahrianur', '420.06.1062', 1, '2023-08-05', '');

--
-- Trigger `pemasukan`
--
DELIMITER $$
CREATE TRIGGER `MASUK` AFTER INSERT ON `pemasukan` FOR EACH ROW BEGIN
  update stokbarang SET stok=stok + NEW.jumlah 
  WHERE kode_brg = NEW.kode_brg;
  
  update stokbarang SET sisa=sisa + NEW.jumlah 
  WHERE kode_brg = NEW.kode_brg;
  
	update pengajuan SET status=1 WHERE kode_brg=NEW.kode_brg AND 
	unit=NEW.unit;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemeliharaan`
--

CREATE TABLE `pemeliharaan` (
  `no_service` int(20) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `kode_brg` int(225) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `catatan` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `status` int(50) NOT NULL DEFAULT 0,
  `tujuan` varchar(225) NOT NULL,
  `tgl_pemeliharaan` date NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemeliharaan`
--

INSERT INTO `pemeliharaan` (`no_service`, `nama_brg`, `kode_brg`, `jumlah`, `catatan`, `unit`, `status`, `tujuan`, `tgl_pemeliharaan`, `gambar`) VALUES
(3, 'r', 0, 0, 'dd', 'Fahrianur', 1, '', '2023-08-06', '64cf109c48b1a.png'),
(55, 'baju', 0, 2500, 'Rusak', 'Fahrianur', 1, '', '2023-08-05', '64ce7e0880ca3.jpeg'),
(676, 'atasan', 0, 7, 'dd', 'Fahrianur', 1, 'bnh', '2023-08-06', '64cf110e6cad4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengajuan`
--

INSERT INTO `pengajuan` (`id_pengajuan`, `unit`, `kode_brg`, `id_jenis`, `jumlah`, `satuan`, `category`, `tgl_pengajuan`, `status`) VALUES
(89, 'Fahrianur', '110.01.0776', 1, 3, 'pcs', '', '2023-08-01', 1),
(90, 'Fahrianur', '110.01.0776', 1, 3, 'pcs', '', '2023-08-01', 1),
(91, 'Fahrianur', '110.01.0776', 1, 2, 'pcs', '', '2023-08-01', 1),
(92, 'Fahrianur', '110.01.0776', 1, 3, 'pcs', '', '2023-08-01', 1),
(93, 'Fahrianur', '110.01.0776', 1, 3, 'pcs', '', '2023-08-01', 1),
(94, 'Fahrianur', '110.01.0776', 1, 4, 'pcs', '', '2023-08-02', 1),
(95, 'Fahrianur', '110.01.0776', 1, 7, 'pcs', '', '2023-08-02', 1),
(96, 'Fahrianur', '110.01.0776', 1, 5, 'pcs', '', '2023-08-02', 1),
(97, 'Fahrianur', '110.01.0776', 1, 3, 'PC', '', '2023-08-02', 1),
(98, 'Fahrianur', '420.06.1062', 2, 3, 'Unit', '', '2023-08-02', 1),
(99, 'Fahrianur', '110.01.0776', 1, 1, 'PC', '', '2023-08-02', 1),
(100, 'Fahrianur', '', 1, 1, '', '', '2023-08-02', 0),
(101, 'Fahrianur', '420.06.1062', 2, 1, 'Unit', '', '2023-08-02', 1),
(102, 'Fahrianur', 'VL15810', 3, 5, 'PAC', '', '2023-08-02', 1),
(103, 'Fahrianur', '420.06.1062', 2, 1, 'Unit', '', '2023-08-02', 1),
(104, 'Fahrianur', '', 1, -4, '', '', '2023-08-03', 0),
(106, 'Fahrianur', '25884666', 1, 2, 'PC', '', '2023-08-03', 1),
(117, 'Fahrianur', '110.01.0776', 1, 2, 'PC', 'G11_ME PARTS & POND MATERIALS', '2023-08-05', 1),
(118, 'Fahrianur', '420.06.1062', 2, 1, 'Unit', 'G06_IT EQUIPMENT', '2023-08-05', 1),
(119, 'Fahrianur', '420.06.1062', 2, 2, 'Unit', 'G06_IT EQUIPMENT', '2023-08-05', 0),
(120, 'Fahrianur', '', 1, 1, '', '', '2023-08-05', 0),
(121, 'Fahrianur', '110.01.0776', 1, 1, 'PC', 'G11_ME PARTS & POND MATERIALS', '2023-08-05', 0),
(122, 'Fahrianur', '110.01.0776', 1, 1, 'PC', 'G11_ME PARTS & POND MATERIALS', '2023-08-05', 0),
(123, 'Fahrianur', 'VL15810', 3, 1, 'VIAL', 'VACC_VACCINE', '2023-08-05', 0),
(124, 'Fahrianur', '25884666', 1, 1, 'PC', 'G11_ME PARTS & POND MATERIALS', '2023-08-06', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_sementara`
--

CREATE TABLE `pengajuan_sementara` (
  `id_pengajuan_sementara` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengajuan_sementara`
--

INSERT INTO `pengajuan_sementara` (`id_pengajuan_sementara`, `unit`, `kode_brg`, `id_jenis`, `jumlah`, `satuan`, `category`, `tgl_pengajuan`, `status`) VALUES
(122, 'Fahrianur', '110.01.0776', 1, 1, 'PC', 'G11_ME PARTS & POND MATERIALS', '2023-08-05', 0),
(123, 'Fahrianur', 'VL15810', 3, 1, 'VIAL', 'VACC_VACCINE', '2023-08-05', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `unit`, `kode_brg`, `jumlah`, `tgl_keluar`, `gambar`) VALUES
(65, 'melia', '110.01.0776', 1, '2023-08-03', ''),
(66, '', '', 0, '2023-08-05', ''),
(67, '', '', 0, '2023-08-05', ''),
(68, '', '', 0, '2023-08-05', ''),
(69, '', '', 0, '2023-08-05', ''),
(70, '', '', 0, '2023-08-05', ''),
(74, 'melia', '420.06.1062', 2023, '2023-08-06', ''),
(75, 'melia', '110.01.0776', 1, '2023-08-06', '');

--
-- Trigger `pengeluaran`
--
DELIMITER $$
CREATE TRIGGER `TG_STOK_UPDATE` AFTER INSERT ON `pengeluaran` FOR EACH ROW BEGIN
	update stokbarang SET keluar=keluar + NEW.jumlah, 
	sisa=stok-keluar WHERE 
	kode_brg = NEW.kode_brg;

	update permintaan SET status=1 WHERE kode_brg=NEW.kode_brg AND 
	unit=NEW.unit;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan`
--

CREATE TABLE `permintaan` (
  `id_permintaan` int(100) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `permintaan`
--

INSERT INTO `permintaan` (`id_permintaan`, `unit`, `jabatan`, `kode_brg`, `id_jenis`, `jumlah`, `tgl_permintaan`, `tujuan`, `status`) VALUES
(118, 'melia', '', '420.06.1062', 2, 2023, '2023-11-10', '', 1),
(123, 'melia', '', '110.01.0776', 1, 1, '2023-08-06', '', 1),
(124, 'melia', '', '110.01.0776', 1, 1, '2023-08-06', '', 0),
(125, 'melia', '', '420.06.1062', 2, 1, '2023-08-06', 'kantor', 0),
(126, 'melia', 'Staff Gudang', '110.01.0776', 1, 1, '2023-08-06', 'kantor bary', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produksi`
--

CREATE TABLE `produksi` (
  `kode` int(40) NOT NULL,
  `kandang` int(40) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `grade_a` int(20) NOT NULL,
  `grade_b` int(20) NOT NULL,
  `komersil` int(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produksi`
--

INSERT INTO `produksi` (`kode`, `kandang`, `jumlah`, `grade_a`, `grade_b`, `komersil`, `total`) VALUES
(1, 7, 3000, 1000, 1000, 1000, 0),
(48, 2, 5200, 3000, 1500, 700, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sementara`
--

CREATE TABLE `sementara` (
  `id_sementara` int(100) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `kode_brg` varchar(20) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stokbarang`
--

CREATE TABLE `stokbarang` (
  `id_kode_brg` int(2) NOT NULL,
  `kode_brg` varchar(20) CHARACTER SET latin1 NOT NULL,
  `id_jenis` int(2) NOT NULL,
  `nama_brg` varchar(50) CHARACTER SET latin1 NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 NOT NULL,
  `satuan` varchar(50) CHARACTER SET latin1 NOT NULL,
  `stok` int(11) NOT NULL,
  `keluar` int(11) NOT NULL,
  `sisa` int(11) NOT NULL,
  `gambar` varchar(225) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stokbarang`
--

INSERT INTO `stokbarang` (`id_kode_brg`, `kode_brg`, `id_jenis`, `nama_brg`, `category`, `satuan`, `stok`, `keluar`, `sisa`, `gambar`) VALUES
(78, '110.01.0776', 1, 'BANDO VAN BELT A-89', 'G11_ME PARTS & POND MATERIALS', 'PC', 10, 2, 8, '64ca61d69b044.jpeg'),
(84, '420.06.1062', 2, 'EPSON L3150 PRINTER', 'G06_IT EQUIPMENT', 'Unit', 2, 2023, -2021, '64cb7f422bfbc.jpeg'),
(85, 'PLV071', 3, 'AE FOX + DILL @ 1000Ds', 'VACC_VACCINE', 'VIAL', 0, 0, 0, '64cb7fd6d28d9.jpg'),
(86, 'VL15810', 3, 'Nobilis MA5 + Clone 30 SPH@1.000 Ds ', 'VACC_VACCINE', 'VIAL', 5, 0, 5, '64cb80220ef28.png'),
(87, 'VL15812', 3, 'Nobilis MA5 + Clone 30 SPH@2.500 Ds ', 'VACC_VACCINE', 'VIAL', 0, 0, 0, '64cb80464b5bc.jpeg'),
(88, '534-2R', 4, 'FEED 534-2R', 'FEED_FEED', 'KG', 0, 0, 0, '64cb807e657dc.jpg'),
(89, 'SL012', 5, 'DOC FEMALE PS ROSS', 'DOC PS_DOC PS', 'EKOR', 0, 0, 0, '64cb80c0523e0.jpeg'),
(90, 'SL016', 5, 'DOC MALE PS ROSS', 'DOC PS_DOC PS', 'EKOR', 0, 0, 0, '64cb80debabaa.jpeg'),
(92, '25884666', 1, 'EPSON L3150 PRINTER', 'G11_ME PARTS & POND MATERIALS', 'PC', 2, 0, 2, '64cb922ece2f6.jpg'),
(93, 'BANDO', 1, '', '1', '', 0, 0, 0, '64cde19c844eb.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_vaksin`
--

CREATE TABLE `tb_vaksin` (
  `no_vaksin` varchar(100) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('Staff_Gudang','Admin','Manager') NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`, `jabatan`, `gambar`) VALUES
(19, 'Fahrianur', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'ADMIN', '64c9cc224b4b2.jpg'),
(20, 'jejen', '21232f297a57a5a743894a0e4a801fc3', 'Manager', 'Manager', '64c9ccb86bd1a.jpg'),
(21, 'melia', '21232f297a57a5a743894a0e4a801fc3', 'Staff_Gudang', 'Staff Gudang', '64c9cabb073e7.png'),
(22, '11', 'baju', '', 'Rusak', '64ce2ced1c2b0.jpeg'),
(23, '55', 'baju', '', 'Rusak', '64ce2d441eb0c.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `masuk_sementara`
--
ALTER TABLE `masuk_sementara`
  ADD PRIMARY KEY (`id_masuk_sementara`);

--
-- Indeks untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemeliharaan`
--
ALTER TABLE `pemeliharaan`
  ADD PRIMARY KEY (`no_service`);

--
-- Indeks untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indeks untuk tabel `pengajuan_sementara`
--
ALTER TABLE `pengajuan_sementara`
  ADD PRIMARY KEY (`id_pengajuan_sementara`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permintaan`
--
ALTER TABLE `permintaan`
  ADD PRIMARY KEY (`id_permintaan`);

--
-- Indeks untuk tabel `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `sementara`
--
ALTER TABLE `sementara`
  ADD PRIMARY KEY (`id_sementara`);

--
-- Indeks untuk tabel `stokbarang`
--
ALTER TABLE `stokbarang`
  ADD PRIMARY KEY (`id_kode_brg`),
  ADD UNIQUE KEY `kode_brg` (`kode_brg`);

--
-- Indeks untuk tabel `tb_vaksin`
--
ALTER TABLE `tb_vaksin`
  ADD PRIMARY KEY (`no_vaksin`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `masuk`
--
ALTER TABLE `masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `masuk_sementara`
--
ALTER TABLE `masuk_sementara`
  MODIFY `id_masuk_sementara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_sementara`
--
ALTER TABLE `pengajuan_sementara`
  MODIFY `id_pengajuan_sementara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `permintaan`
--
ALTER TABLE `permintaan`
  MODIFY `id_permintaan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT untuk tabel `sementara`
--
ALTER TABLE `sementara`
  MODIFY `id_sementara` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT untuk tabel `stokbarang`
--
ALTER TABLE `stokbarang`
  MODIFY `id_kode_brg` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
