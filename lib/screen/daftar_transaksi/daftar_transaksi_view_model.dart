import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundry/screen/view_detail_transaksi/view_detail_transaksi.dart';
import './daftar_transaksi.dart';

abstract class DaftarTransaksiViewModel extends State<DaftarTransaksi> {
  // Add your state and logic here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference transaksi =
      FirebaseFirestore.instance.collection('transaksi');

  tapDetail({String id}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ViewDetailTransaksi(
                idDoc: id,
              )),
    );
  }
}
