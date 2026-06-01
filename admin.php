<?php
session_start();
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: login.php");
    exit();
}

include 'koneksi.php';
include 'knn.php'; // 1. WAJIB INCLUDE FILE kNN DI SINI

// Proses Hapus
if (isset($_GET['hapus'])) {
    $id_hapus = (int) $_GET['hapus'];
    mysqli_query($koneksi, "DELETE FROM bansos WHERE id = $id_hapus");
    header("Location: admin.php");
    exit();
}

// Proses Simpan (Tambah / Edit)
if (isset($_POST['simpan'])) {
    $id = (int) $_POST['id'];
    $nama = mysqli_real_escape_string($koneksi, $_POST['nama']);
    $nama_prov = mysqli_real_escape_string($koneksi, $_POST['nama_prov']);
    $nama_kab = mysqli_real_escape_string($koneksi, $_POST['nama_kab']);
    $pekerjaan = mysqli_real_escape_string($koneksi, $_POST['pekerjaan']);
    $tanggungan = (int) $_POST['tanggungan'];
    $jumlah_anak = (int) $_POST['jumlah_anak'];
    $penghasilan = (float) $_POST['penghasilan_per_bulan'];
    
    // 2. STRUKTURKAN INPUT UNTUK kNN
    $input_baru = [
        'penghasilan_per_bulan' => $penghasilan,
        'jumlah_anak' => $jumlah_anak,
        'tanggungan' => $tanggungan
    ];
    
    // 3. GUNAKAN PREDIKSI kNN (Sama seperti index.php, gunakan K=5)
    $status_kelayakan = prediksiKNN($koneksi, $input_baru, 5);
    $alasan = "Prediksi menggunakan algoritma Machine Learning kNN (Data-Driven)";
    
    if ($id > 0) {
        // Update
        $query = "UPDATE bansos SET 
                    nama='$nama', nama_prov='$nama_prov', nama_kab='$nama_kab', 
                    pekerjaan='$pekerjaan', tanggungan='$tanggungan', jumlah_anak='$jumlah_anak',
                    penghasilan_per_bulan='$penghasilan', 
                    status_kelayakan='$status_kelayakan',
                    alasan='$alasan'
                  WHERE id=$id";
    } else {
        // Insert
        $query = "INSERT INTO bansos (nama, nama_prov, nama_kab, pekerjaan, tanggungan, jumlah_anak, penghasilan_per_bulan, status_kelayakan, alasan) 
                  VALUES ('$nama', '$nama_prov', '$nama_kab', '$pekerjaan', '$tanggungan', '$jumlah_anak', '$penghasilan', '$status_kelayakan', '$alasan')";
    }
    mysqli_query($koneksi, $query);
    header("Location: admin.php");
    exit();
}

// Ambil data untuk Edit
$edit_id = 0;
$edit_nama = '';
$edit_nama_prov = '';
$edit_nama_kab = '';
$edit_pekerjaan = '';
$edit_tanggungan = '';
$edit_anak = '';
$edit_penghasilan = '';

if (isset($_GET['edit'])) {
    $id_edit = (int) $_GET['edit'];
    $res = mysqli_query($koneksi, "SELECT * FROM bansos WHERE id = $id_edit");
    if ($data = mysqli_fetch_assoc($res)) {
        $edit_id = $data['id'];
        $edit_nama = $data['nama'];
        $edit_nama_prov = $data['nama_prov'];
        $edit_nama_kab = $data['nama_kab'];
        $edit_pekerjaan = $data['pekerjaan'];
        $edit_tanggungan = $data['tanggungan'];
        $edit_anak = $data['jumlah_anak'];
        $edit_penghasilan = $data['penghasilan_per_bulan'];
    }
}
?>
<html>
<head>
    <title>Halaman Admin Bansos</title>
</head>
<body>

<h1>Halaman Admin - Data Lengkap Bansos</h1>
<a href="index.php">Lihat Web Warga</a> | <a href="akurasi.php">Lihat Evaluasi Model (kNN)</a> | <a href="logout.php">Logout</a>
<hr>

<h3><?= ($edit_id > 0) ? 'Edit Data Warga' : 'Tambah Data Warga' ?></h3>
