-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jul 2025 pada 21.11
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliner`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `idAdmin` int(11) NOT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_admin`
--

INSERT INTO `tbl_admin` (`idAdmin`, `userName`, `password`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_order`
--

CREATE TABLE `tbl_detail_order` (
  `idDetailOrder` int(11) NOT NULL,
  `idOrder` int(11) DEFAULT NULL,
  `idProduk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_detail_order`
--

INSERT INTO `tbl_detail_order` (`idDetailOrder`, `idOrder`, `idProduk`, `jumlah`, `harga`) VALUES
(14, 13, 17, 1, 10000),
(15, 14, 17, 1, 10000),
(16, 15, 17, 1, 10000),
(17, 16, 17, 3, 10000),
(18, 17, 17, 1, 10000),
(19, 18, 17, 1, 10000),
(20, 19, 17, 1, 10000),
(21, 20, 17, 1, 10000),
(22, 21, 17, 1, 10000),
(23, 22, 17, 1, 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `idkat` int(11) NOT NULL,
  `namaKat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`idkat`, `namaKat`) VALUES
(12, 'Makanan'),
(14, 'Minuman'),
(20, 'Cemilan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mitra`
--

CREATE TABLE `tbl_mitra` (
  `idToko` int(11) NOT NULL,
  `namaOwner` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `namaToko` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `idKota` int(11) NOT NULL,
  `tlpn` int(11) NOT NULL,
  `statusAktif` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_mitra`
--

INSERT INTO `tbl_mitra` (`idToko`, `namaOwner`, `username`, `password`, `namaToko`, `logo`, `deskripsi`, `alamat`, `idKota`, `tlpn`, `statusAktif`) VALUES
(2, 'Tahu Walik', 'zee123', '74be16979710d4c4e7c6647856088456', 'Kuliner cemilan ringan', 'profil.jpeg', 'Tahu walik adalah hidangan tradisional Indonesia yang terbuat dari tahu yang diiris tipis-tipis dan dicampur dengan beragam bumbu rempah\r\n\r\nJl. Candi Gebang, Dero, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', 'Yogyakarta', 419, 81339, 'Y'),
(11, 'Viktory 2', 'Viktori', '827ccb0eea8a706c4c34a16891f84e7b', 'Hotang Mozrareella', 'OIP.jpeg', 'Hotang adalah hotdog kentang, yaitu jajanan yang berasal dari Korea dan biasa tersaji di street food Korea. Dalam Bahasa Korea, jajanan ini dikenal dengan sebutan tokkebi, dan menggunakan kentang atau sosis sebagai bahan utamanya.', 'Jl. Mancasan Indah IV No.2, Ngringin, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', 419, 2147483647, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ongkir`
--

CREATE TABLE `tbl_ongkir` (
  `idOngkir` int(11) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `kurir` varchar(25) NOT NULL,
  `ongkos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_ongkir`
--

INSERT INTO `tbl_ongkir` (`idOngkir`, `tujuan`, `kurir`, `ongkos`) VALUES
(2, 'Jogja', 'TIKI', 5000),
(3, 'Bandung', 'TIKI', 10000),
(6, 'Klaten', 'JNE', 70000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order`
--

CREATE TABLE `tbl_order` (
  `idOrder` int(11) NOT NULL,
  `idKonsumen` int(11) DEFAULT NULL,
  `idToko` int(11) NOT NULL,
  `tglOrder` date DEFAULT NULL,
  `statusOrder` enum('Belum Bayar','Dikemas','Dikirim','Diterima','Selesai','Dibatalkan') DEFAULT NULL,
  `kurir` varchar(50) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_order`
--

INSERT INTO `tbl_order` (`idOrder`, `idKonsumen`, `idToko`, `tglOrder`, `statusOrder`, `kurir`, `ongkir`) VALUES
(1, 2, 2, '2024-07-11', 'Selesai', 'JNE OKE', 7000),
(9, 2, 2, '2024-12-29', 'Belum Bayar', 'JNE OKE', 7000),
(10, 2, 2, '2024-12-29', 'Belum Bayar', 'JNE OKE', 7000),
(12, 2, 2, '2025-05-20', 'Belum Bayar', 'JNE OKE', 7000),
(13, 2, 2, '2025-06-21', 'Belum Bayar', 'JNE OKE', 7000),
(14, 2, 2, '2025-06-25', 'Belum Bayar', 'JNE OKE', 7000),
(15, 2, 2, '2025-06-25', 'Belum Bayar', 'JNE OKE', 7000),
(16, 2, 2, '2025-06-25', 'Belum Bayar', 'JNE OKE', 7000),
(17, 2, 2, '2025-07-31', 'Belum Bayar', '', 0),
(18, 2, 2, '2025-07-31', 'Belum Bayar', '', 0),
(19, 2, 2, '2025-07-31', 'Belum Bayar', 'JNE OKE', 12000),
(20, 2, 2, '2025-07-31', 'Belum Bayar', 'JNE OKE', 12000),
(21, 2, 2, '2025-07-31', 'Belum Bayar', 'JNE OKE', 12000),
(22, 2, 2, '2025-07-31', 'Belum Bayar', 'JNE OKE', 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `idProduk` int(11) NOT NULL,
  `idKat` int(11) DEFAULT NULL,
  `idToko` int(11) DEFAULT NULL,
  `namaProduk` varchar(200) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `deskripsiProduk` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_produk`
--

INSERT INTO `tbl_produk` (`idProduk`, `idKat`, `idToko`, `namaProduk`, `foto`, `harga`, `stok`, `berat`, `deskripsiProduk`) VALUES
(17, 20, 2, 'Tahu Walik', 'tahu_walik.jpg', 10000, 50, 250, 'Paket Medium varian isi 14 dengan harga 10.000\r\nmemiliki beraneka ragam sambal'),
(18, 20, 2, 'Tahu Walik', 'IMG_5282-scaled.jpg', 5000, 50, 100, 'Paket Small Varian isi 7 dengan harga hanya 5.000\r\nmemiliki macam varian sambal'),
(19, 20, 2, 'Tahu Walik', '74020b6d-c162-49ae-990f-07dbdcd5def2.jpg', 15000, 50, 350, 'Paket Large Varian isi 22 pcs dengan harga 15.000\r\nmemiliki macam varian sambal'),
(20, 20, 2, 'Tahu Walik', 'tahu-walik-foto-resep-utama.jpg', 20000, 50, 450, 'Paket X-Large Varian isi 29 pcs dengan harga 20.000\r\nmemiliki macam varian sambal'),
(21, 20, 11, 'Hotang Mozzarella Sosis', 'hotang.jpg', 12000, 20, 100, 'Hotang mozzarella campur sosis menjadi jenis yang digemari banyak orang. Perpaduan renyahnya tepung dengan lelehan keju mozzarella dan sedapnya sosis'),
(22, 20, 11, 'Corndog', 'corndog.jpg', 10000, 20, 100, 'Corndog adalah makanan yang terdiri dari sosis yang ditusuk menggunakan stik, kemudian dilapisi dengan adonan tepung jagung dan digoreng hingga keemasan.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `idKonsumen` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `namaKonsumen` varchar(50) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `idKota` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tlpn` int(11) DEFAULT NULL,
  `statusAktif` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`idKonsumen`, `username`, `password`, `namaKonsumen`, `alamat`, `idKota`, `email`, `tlpn`, `statusAktif`) VALUES
(2, 'Ocha', 'aa08769cdcb26674c6706093503ff0a3', 'Ocha', 'Jl. Cepit Baru 186a/324 Rt 009 Rw 038, Soropadan, Condongcatur, Depok, Sleman, Yogyakarta 55283', 419, 'ocha@gmail.com', 12345678, 'Y');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indeks untuk tabel `tbl_detail_order`
--
ALTER TABLE `tbl_detail_order`
  ADD PRIMARY KEY (`idDetailOrder`),
  ADD KEY `idProduk` (`idProduk`),
  ADD KEY `idOrder` (`idOrder`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`idkat`);

--
-- Indeks untuk tabel `tbl_mitra`
--
ALTER TABLE `tbl_mitra`
  ADD PRIMARY KEY (`idToko`);

--
-- Indeks untuk tabel `tbl_ongkir`
--
ALTER TABLE `tbl_ongkir`
  ADD PRIMARY KEY (`idOngkir`);

--
-- Indeks untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`idOrder`),
  ADD KEY `idKonsumen` (`idKonsumen`),
  ADD KEY `idToko` (`idToko`);

--
-- Indeks untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`idProduk`),
  ADD KEY `idKat` (`idKat`),
  ADD KEY `idToko` (`idToko`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`idKonsumen`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_detail_order`
--
ALTER TABLE `tbl_detail_order`
  MODIFY `idDetailOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `idkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tbl_mitra`
--
ALTER TABLE `tbl_mitra`
  MODIFY `idToko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_ongkir`
--
ALTER TABLE `tbl_ongkir`
  MODIFY `idOngkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `idProduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `idKonsumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_detail_order`
--
ALTER TABLE `tbl_detail_order`
  ADD CONSTRAINT `tbl_detail_order_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `tbl_order` (`idOrder`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_detail_order_ibfk_2` FOREIGN KEY (`idProduk`) REFERENCES `tbl_produk` (`idProduk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`idKonsumen`) REFERENCES `tbl_user` (`idKonsumen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`idToko`) REFERENCES `tbl_mitra` (`idToko`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD CONSTRAINT `tbl_produk_ibfk_2` FOREIGN KEY (`idToko`) REFERENCES `tbl_mitra` (`idToko`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_produk_ibfk_3` FOREIGN KEY (`idKat`) REFERENCES `tbl_kategori` (`idkat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
