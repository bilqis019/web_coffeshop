-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2026 pada 12.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kedai_kopi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `tanggal_dibuat` datetime DEFAULT current_timestamp(),
  `tanggal_diperbarui` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `konten`, `penulis`, `tanggal_dibuat`, `tanggal_diperbarui`) VALUES
(1, 'Kedai Kopi Buka Cabang Baru', 'Kami dengan senang hati mengumumkan pembukaan cabang baru yang lebih luas dan nyaman untuk menemani hari-hari ngopi Anda.', 'Admin Kedai Kopi', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(2, 'Promo Buy 1 Get 1 Setiap Senin', 'Nikmati promo spesial setiap hari Senin untuk semua menu kopi susu. Berlaku dine-in saja, syarat dan ketentuan berlaku.', 'Admin Kedai Kopi', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(3, 'Biji Kopi Lokal Pilihan', 'Kami hanya menggunakan biji kopi lokal terbaik dari petani nusantara yang telah melalui proses roasting berkualitas.', 'Admin Kedai Kopi', '2026-07-01 12:16:34', '2026-07-01 12:16:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `jawaban` text NOT NULL,
  `urutan` int(11) NOT NULL DEFAULT 0,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `faq`
--

INSERT INTO `faq` (`id`, `pertanyaan`, `jawaban`, `urutan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apakah Kopi Senja menerima pemesanan online?', 'Saat ini kami belum melayani pemesanan online.\nSilakan datang langsung ke kedai untuk menikmati menu kami.', 1, 'aktif', '2026-07-01 15:41:02', '2026-07-01 15:41:02'),
(2, 'Apakah tersedia Wi-Fi gratis?', 'Ya, kami menyediakan Wi-Fi gratis untuk semua pelanggan yang berkunjung.', 2, 'aktif', '2026-07-01 15:41:02', '2026-07-01 15:41:02'),
(3, 'Jam berapa kedai buka setiap hari?', 'Kedai kami buka setiap hari.\nSenin-Jumat pukul 08.00-22.00, Sabtu-Minggu pukul 09.00-23.00.', 3, 'aktif', '2026-07-01 15:41:02', '2026-07-01 15:41:02'),
(4, 'apakah tersedia parkiran mobil?', 'tersedia banget', 0, 'aktif', '2026-07-01 15:43:07', '2026-07-01 15:43:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pesan` text NOT NULL,
  `status` enum('baru','dibaca','ditutup') NOT NULL DEFAULT 'baru',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `feedback`
--

INSERT INTO `feedback` (`id`, `nama`, `email`, `pesan`, `status`, `created_at`) VALUES
(1, 'bleeh', 'bleehimoets@gmail.com', 'enak banget', 'baru', '2026-07-01 15:53:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `kategori` varchar(50) NOT NULL DEFAULT 'Coffee',
  `harga` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `status` enum('tersedia','habis') NOT NULL DEFAULT 'tersedia',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `nama_menu`, `kategori`, `harga`, `deskripsi`, `gambar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Espresso', 'Coffee', 18000.00, 'Espresso murni dari biji kopi robusta pilihan, pekat dan aromatik.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(2, 'Cappuccino', 'Coffee', 99999999.99, 'Perpaduan espresso, susu steamed, dan foam lembut di atasnya.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 13:07:13'),
(3, 'Kopi Susu Gula Aren', 'Coffee', 22000.00, 'Kopi susu khas nusantara dengan manis alami gula aren.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(4, 'Cafe Latte', 'Coffee', 99999999.99, 'Espresso lembut berpadu susu creamy, cocok untuk pemula.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 13:07:05'),
(5, 'Matcha Latte', 'Non-Coffee', 2400000.00, 'Matcha premium Jepang dipadu susu segar.', 'menu_6a44bcb0cbd42.jpg', 'tersedia', '2026-07-01 12:16:34', '2026-07-01 14:07:28'),
(6, 'Chocolate Milk', 'Non-Coffee', 22000.00, 'Cokelat premium yang creamy dan kaya rasa.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(7, 'Roti Bakar Coklat Keju', 'Makanan', 18000.00, 'Roti bakar renyah dengan topping coklat dan keju melimpah.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(8, 'Croissant Butter', 'Makanan', 20000.00, 'Croissant lembut berlapis dengan aroma butter yang khas.', NULL, 'tersedia', '2026-07-01 12:16:34', '2026-07-01 12:16:34'),
(9, 'Red Velvet', 'Non-Coffee', 3000000.00, 'Stoberi', 'menu_6a44da69bcd4e.jpg', 'tersedia', '2026-07-01 12:56:55', '2026-07-01 16:14:17'),
(10, 'thai tea', 'Non-Coffee', 20000.00, '', NULL, 'tersedia', '2026-07-01 14:09:14', '2026-07-01 14:09:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `partners`
--

INSERT INTO `partners` (`id`, `nama`, `deskripsi`, `foto`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Gofood', 'aplikasi pengantar makanan', 'uploads/partners/1782897077_Gofood.jpg', 'aktif', '2026-07-01 16:11:17', '2026-07-01 16:11:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `jumlah_orang` int(11) NOT NULL DEFAULT 1,
  `catatan` text DEFAULT NULL,
  `status` enum('baru','dikonfirmasi','dibatalkan') NOT NULL DEFAULT 'baru',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reservasi`
--

INSERT INTO `reservasi` (`id`, `nama_pelanggan`, `email`, `telepon`, `tanggal`, `jam`, `jumlah_orang`, `catatan`, `status`, `created_at`) VALUES
(1, 'bleeh love nano', 'bleehnanoforever@gmail.com', '08545423464', '2027-02-14', '12:00:00', 2, 'first date', 'baru', '2026-07-01 15:56:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `passwod` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `passwod`, `created_at`) VALUES
(1, 'Admin Kedai Kopi', 'admin@kedaikopi.com', '$2b$10$5xd8U7hVRRR/nFiJFTJjGePQUqPBOI3Oe67a6zGVVug8w7aC2Xx1a', '2026-07-01 12:16:34');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
