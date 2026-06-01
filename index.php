<?php
include 'koneksi.php';
include 'knn.php';

if (isset($_POST['submit'])) {

    $nama = mysqli_real_escape_string($koneksi, $_POST['nama']);
    $nama_prov = mysqli_real_escape_string($koneksi, $_POST['nama_prov']);
    $nama_kab = mysqli_real_escape_string($koneksi, $_POST['nama_kab']);
    $pekerjaan = mysqli_real_escape_string($koneksi, $_POST['pekerjaan']);
    $tanggungan = (int) $_POST['tanggungan'];
    $jumlah_anak = (int) $_POST['jumlah_anak'];
    $penghasilan = (float) $_POST['penghasilan_per_bulan'];

    // INPUT DATA UNTUK kNN
    $input = [
        'penghasilan_per_bulan' => $penghasilan,
        'jumlah_anak' => $jumlah_anak,
        'tanggungan' => $tanggungan
    ];

    // PREDIKSI kNN (Nilai K diubah menjadi 5 agar lebih akurat dan realistis)
    $status_kelayakan = prediksiKNN($koneksi, $input, 5);

    // ALASAN
    $alasan = "Prediksi menggunakan algoritma Machine Learning kNN";

    // SIMPAN KE DATABASE
    $query = "INSERT INTO bansos 
    (nama, nama_prov, nama_kab, pekerjaan, tanggungan, jumlah_anak, penghasilan_per_bulan, status_kelayakan, alasan) 
    VALUES 
    ('$nama', '$nama_prov', '$nama_kab', '$pekerjaan', '$tanggungan', '$jumlah_anak', '$penghasilan', '$status_kelayakan', '$alasan')";

    if (mysqli_query($koneksi, $query)) {

        $status_tampil = ($status_kelayakan == 'Layak') ? 'LULUS' : 'TIDAK LULUS';
        $warna_teks = ($status_kelayakan == 'Layak') ? 'green' : 'red';

        $pesan = "
        <fieldset style='border: 2px solid $warna_teks;'>
            <legend>
                <h3 style='color: $warna_teks; margin: 0;'>
                    Hasil Prediksi Machine Learning
                </h3>
            </legend>

            <table border='0' cellpadding='5'>
                <tr>
                    <td>Nama</td>
                    <td>: <b>$nama</b></td>
                </tr>
                <tr>
                    <td>Provinsi</td>
                    <td>: <b>$nama_prov</b></td>
                </tr>
                <tr>
                    <td>Kab/Kota</td>
                    <td>: <b>$nama_kab</b></td>
                </tr>
                <tr>
                    <td>Pekerjaan</td>
                    <td>: <b>$pekerjaan</b></td>
                </tr>
                <tr>
                    <td>Tanggungan</td>
                    <td>: <b>$tanggungan</b></td>
                </tr>
                <tr>
                    <td>Jumlah Anak</td>
                    <td>: <b>$jumlah_anak</b></td>
                </tr>
                <tr>
                    <td>Penghasilan</td>
                    <td>: <b>Rp " . number_format($penghasilan, 0, ',', '.') . "</b></td>
                </tr>
            </table>

            <hr>

            <b>
                Status Prediksi:
                <span style='color: $warna_teks;'>
                    $status_tampil
                </span>
            </b>
            <br>
            Nilai K yang digunakan: <b>5</b>

            <br><br>

            Alasan:
            $alasan

            <br><br>

            <div style='text-align: center;'>
                <a href='index.php'>
                    <button type='button' style='padding: 8px 15px; font-weight: bold; cursor: pointer;'>
                        Cek Warga Baru
                    </button>
                </a>
            </div>

        </fieldset>
        ";

    } else {
        $pesan_error = "Gagal menambah data: " . mysqli_error($koneksi);
    }
}
?>

<html>
<head>
    <title>Machine Learning kNN Bansos</title>
</head>
<body>

<div align="center" style="margin-top: 30px;">

    <h1>Sistem Prediksi Kelayakan Bansos Menggunakan kNN</h1>
    
    <div style="width: 450px; text-align: left; margin-bottom: 20px; border: 1px dashed #777; padding: 10px; background-color: #f9f9f9;">
        <p style="margin-top: 0;">
            Sistem ini menggunakan algoritma <b>Machine Learning k-Nearest Neighbor (kNN)</b> 
            untuk memprediksi kelayakan penerima bantuan sosial berdasarkan fitur:
        </p>
        <ul style="margin-bottom: 0;">
            <li>Penghasilan per bulan</li>
            <li>Jumlah anak</li>
            <li>Jumlah tanggungan</li>
        </ul>
    </div>

    <fieldset style="width: 350px; text-align: left;">
        <legend>
            <h3>Input Data Warga</h3>
        </legend>

        <form method="POST" action="">
            <table border="0" cellpadding="5">
                <tr>
                    <td>Nama Lengkap</td>
                    <td>: <input type="text" name="nama" required></td>
                </tr>
                <tr>
                    <td>Provinsi</td>
                    <td>: <input type="text" name="nama_prov" required></td>
                </tr>
                <tr>
                    <td>Kabupaten/Kota</td>
                    <td>: <input type="text" name="nama_kab" required></td>
                </tr>
                <tr>
                    <td>Pekerjaan</td>
                    <td>: <input type="text" name="pekerjaan" required></td>
                </tr>
                <tr>
                    <td>Tanggungan</td>
                    <td>: <input type="number" name="tanggungan" required></td>
                </tr>
                <tr>
                    <td>Jumlah Anak</td>
                    <td>: <input type="number" name="jumlah_anak" required></td>
                </tr>
                <tr>
                    <td>Penghasilan/Bulan</td>
                    <td>: <input type="number" name="penghasilan_per_bulan" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" name="submit">
                            Prediksi Kelayakan
                        </button>
                    </td>
                </tr>
            </table>
        </form>

        <div style="text-align: center; margin-top: 10px;">
            <a href="status_kelayakan.php">
                Lihat Data Kelayakan
            </a>
        </div>
    </fieldset>

    <?php if (isset($pesan) || isset($pesan_error)): ?>
    <div style="display: block; text-align: left; width: 450px; margin: 20px auto 0 auto;">
        <?php
        if (isset($pesan)) echo $pesan;
        if (isset($pesan_error)) {
            echo "<p style='color:red; text-align:center;'><b>$pesan_error</b></p>";
        }
        ?>
    </div>
    <?php endif; ?>

</div>

</body>
</html>
