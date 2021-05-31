import 'package:flutter/material.dart';
import './review_transaksi_view.dart';

class ReviewTransaksi extends StatefulWidget {
  final String nama;
  final int durasiPengerjaan;
  final String tanggalTransaksi;
  final String tanggalSelesai;
  final int totalHarga;
  final String keterangan;
  final List listLayanan;

  const ReviewTransaksi(
      {Key key,
      this.nama,
      this.durasiPengerjaan,
      this.tanggalTransaksi,
      this.tanggalSelesai,
      this.totalHarga,
      this.listLayanan, this.keterangan})
      : super(key: key);

  @override
  ReviewTransaksiView createState() => new ReviewTransaksiView();
}
