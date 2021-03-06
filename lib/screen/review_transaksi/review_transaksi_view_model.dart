import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundry/screen/home_screen/home_screen.dart';
import './review_transaksi.dart';

abstract class ReviewTransaksiViewModel extends State<ReviewTransaksi> {
  // Add your state and logic here

  List listLayanan = [];
  bool isLoad = true;
  String keterangan = "";
  String tanggaTransaksi = "";
  String tanggalSelesai = "";
  int durasiPengerjaan = 0;
  String nama = "";
  int totalHarga = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference transaksi =
      FirebaseFirestore.instance.collection('transaksi');
  bool isSave = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() {
    nama = this.widget.nama;
    keterangan = this.widget.keterangan;
    tanggaTransaksi = this.widget.tanggalTransaksi;
    tanggalSelesai = this.widget.tanggalSelesai;
    durasiPengerjaan = this.widget.durasiPengerjaan;
    listLayanan.addAll(this.widget.listLayanan);
    totalHarga = this.widget.totalHarga;

    setState(() {
      isLoad = false;
    });
  }

  tapSimpan() async {
    setState(() {
      isSave = true;
    });
    await transaksi.add({
      'nama': nama,
      'keterangan': keterangan,
      'tanggaTransaksi': tanggaTransaksi,
      'tanggalSelesai': tanggalSelesai,
      'durasiPengerjaan': durasiPengerjaan,
      'listLayanan': listLayanan,
      'totalHarga': totalHarga,
      'createdAt': DateTime.now()
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: const Text('Transaksi berhasil di simpan'),
        backgroundColor: Colors.green,
      ),
    );

    setState(() {
      isSave = false;
    });

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        ModalRoute.withName('/'));
  }
}
