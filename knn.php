<?php

// Fungsi menghitung jarak Euclidean
function hitungJarak($dataTraining, $dataInput)
{
    $jarak = sqrt(
        pow($dataTraining['penghasilan_per_bulan'] - $dataInput['penghasilan_per_bulan'], 2) +
        pow($dataTraining['jumlah_anak'] - $dataInput['jumlah_anak'], 2) +
        pow($dataTraining['tanggungan'] - $dataInput['tanggungan'], 2)
    );

    return $jarak;
}


// Mengambil data training dari database
function ambilDataset($koneksi, $limit = 40)
{
    $dataset = [];

    $sql = "SELECT * FROM bansos LIMIT $limit";
    $query = mysqli_query($koneksi, $sql);

    while ($row = mysqli_fetch_assoc($query)) {
        $dataset[] = $row;
    }

    return $dataset;
}


// Fungsi utama prediksi kNN
function prediksiKNN($koneksi, $inputUser, $k = 3)
{
    // Ambil data training
    $dataset = ambilDataset($koneksi);

    $hasilJarak = [];

    // Hitung jarak semua data training
    foreach ($dataset as $data) {

        $jarak = hitungJarak($data, $inputUser);

        $hasilJarak[] = [
            'jarak' => $jarak,
            'label' => $data['status_kelayakan']
        ];
    }

    // Urutkan dari jarak terkecil
    usort($hasilJarak, function ($a, $b) {
        return $a['jarak'] <=> $b['jarak'];
    });

    // Ambil K tetangga terdekat
    $tetanggaTerdekat = array_slice($hasilJarak, 0, $k);

    // Proses voting
    $jumlahLabel = [];

    foreach ($tetanggaTerdekat as $tetangga) {

        $label = $tetangga['label'];

        if (!isset($jumlahLabel[$label])) {
            $jumlahLabel[$label] = 0;
        }

        $jumlahLabel[$label]++;
    }

    // Urutkan voting terbesar
    arsort($jumlahLabel);

    // Ambil hasil voting tertinggi
    $hasilPrediksi = array_key_first($jumlahLabel);

    return $hasilPrediksi;
}

?>
