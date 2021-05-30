import 'package:flutter/material.dart';
import 'package:laundry/screen/add_nama_transaksi/add_nama_transaksi.dart';
import 'package:laundry/screen/daftar_transaksi/daftar_transaksi.dart';
import './home_screen.dart';

abstract class HomeScreenViewModel extends State<HomeScreen> {
  // Add your state and logic here

  tapMasukanTransaksi() {
    print("Masusk");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNamaTransaksi()),
    );
  }

  tapDaftarTransaksi() {
    print("dafta");
     Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DaftarTransaksi()),
    );
  }
}
