import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './add_nama_transaksi.dart';

abstract class AddNamaTransaksiViewModel extends State<AddNamaTransaksi> {
  // Add your state and logic here

  TextEditingController namaCtrl = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  addData() {
      users.add({
        "name" : namaCtrl.text
      });
      namaCtrl.text = "";
  }
}
