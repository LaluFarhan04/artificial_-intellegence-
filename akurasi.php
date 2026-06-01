<?php
include 'koneksi.php';
include 'knn.php'; 

// Ambil data testing (Data ke-41 sampai 50 digunakan untuk testing)
$sql = "SELECT * FROM bansos LIMIT 40,10";
$query = mysqli_query($koneksi, $sql);

$totalData = 0;
$prediksiBenar = 0;

// Inisialisasi variabel Confusion Matrix
$TP = 0; // Asli Layak, Prediksi Layak
$TN = 0; // Asli Tidak Layak, Prediksi Tidak Layak
$FP = 0; // Asli Tidak Layak, Prediksi Layak
$FN = 0; // Asli Layak, Prediksi Tidak Layak
?>

<html>
<head>
    <title>Evaluasi Accuracy kNN</title>
</head>
<body>

<h1>Evaluasi Algoritma k-Nearest Neighbor (kNN)</h1>
<hr>

<table border="1" cellpadding="8" cellspacing="0">
    <tr style="background-color: #f2f2f2;">
        <th>No</th>
        <th>Nama</th>
        <th>Status Asli</th>
        <th>Hasil Prediksi</th>
        <th>Keterangan</th>
    </tr>

<?php
$no = 1;
while ($data = mysqli_fetch_assoc($query)) {
    $input = [
        'penghasilan_per_bulan' => $data['penghasilan_per_bulan'],
        'jumlah_anak' => $data['jumlah_anak'],
        'tanggungan' => $data['tanggungan']
    ];

    // Menggunakan K=5 konsisten dengan halaman depan
    $hasilPrediksi = prediksiKNN($koneksi, $input, 5); 
    $statusAsli = $data['status_kelayakan'];

    // Mengubah ke huruf kecil & hapus spasi cadangan agar pengecekan akurat
    $asli = trim(strtolower($statusAsli));
    $prediksi = trim(strtolower($hasilPrediksi));

    if ($prediksi == $asli) {
        $keterangan = "<span style='color:green; font-weight:bold;'>BENAR</span>";
        $prediksiBenar++;
    } else {
        $keterangan = "<span style='color:red; font-weight:bold;'>SALAH</span>";
    }

    // Perhitungan Confusion Matrix berdasarkan string 'layak' / 'tidak layak'
    if ($asli == 'layak' && $prediksi == 'layak') {
        $TP++;
    } else if ($asli == 'tidak layak' && $prediksi == 'tidak layak') {
        $TN++;
    } else if ($asli == 'tidak layak' && $prediksi == 'layak') {
        $FP++;
    } else if ($asli == 'layak' && $prediksi == 'tidak layak') {
        $FN++;
    }

    $totalData++;

    echo "
    <tr>
        <td>$no</td>
        <td>{$data['nama']}</td>
        <td>$statusAsli</td>
        <td>$hasilPrediksi</td>
        <td>$keterangan</td>
    </tr>
    ";
    $no++;
}

// Menghitung Rumus Metrik Evaluasi
$accuracy = ($totalData > 0) ? ($prediksiBenar / $totalData) * 100 : 0;
$precision = (($TP + $FP) > 0) ? ($TP / ($TP + $FP)) * 100 : 0;
$recall = (($TP + $FN) > 0) ? ($TP / ($TP + $FN)) * 100 : 0;
?>
</table>

<br>
<h2>Hasil Ringkasan Evaluasi:</h2>
<table border="0" cellpadding="5">
    <tr><td>Total Data Testing</td><td>: <b><?= $totalData; ?></b> Data</td></tr>
    <tr><td>Prediksi Benar</td><td>: <b><?= $prediksiBenar; ?></b> Data</td></tr>
    <tr><td><h3>Accuracy Model</h3></td><td>: <h3 style="color: blue;"><?= number_format($accuracy, 2); ?>%</h3></td></tr>
</table>

<hr>

<h3>Confusion Matrix (Nilai Tambah Tugas)</h3>
<table border="1" cellpadding="10" cellspacing="0" style="text-align: center;">
    <tr style="background-color: #f2f2f2;">
        <th rowspan="2">Kondisi Aktual</th>
        <th colspan="2">Hasil Prediksi Model kNN</th>
    </tr>
    <tr style="background-color: #f2f2f2;">
        <th>Prediksi LAYAK</th>
        <th>Prediksi TIDAK LAYAK</th>
    </tr>
    <tr>
        <td style="background-color: #f2f2f2;"><b>Aktual LAYAK</b></td>
        <td style="background-color: #e2f0d9;"><b>TP (True Positive):</b> <?= $TP; ?></td>
        <td style="background-color: #fce4d6;"><b>FN (False Negative):</b> <?= $FN; ?></td>
    </tr>
    <tr>
        <td style="background-color: #f2f2f2;"><b>Aktual TIDAK LAYAK</b></td>
        <td style="background-color: #fce4d6;"><b>FP (False Positive):</b> <?= $FP; ?></td>
        <td style="background-color: #e2f0d9;"><b>TN (True Negative):</b> <?= $TN; ?></td>
    </tr>
</table>

<br>

<h3>Nilai Tambah: Precision & Recall</h3>
<table border="1" cellpadding="6" cellspacing="0">
    <tr style="background-color: #f2f2f2;">
        <th>Metrik</th>
        <th>Nilai</th>
        <th>Rumus Klasifikasi</th>
    </tr>
    <tr>
        <td><b>Precision</b></td>
        <td><b><?= number_format($precision, 2); ?>%</b></td>
        <td>$$Precision = \frac{TP}{TP + FP}$$</td>
    </tr>
    <tr>
        <td><b>Recall</b></td>
        <td><b><?= number_format($recall, 2); ?>%</b></td>
        <td>$$Recall = \frac{TP}{TP + FN}$$</td>
    </tr>
</table>

<hr>
<a href="index.php"><button>Kembali ke Halaman Utama</button></a>

</body>
</html>
