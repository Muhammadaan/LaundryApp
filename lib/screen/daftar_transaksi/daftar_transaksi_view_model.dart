import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './daftar_transaksi.dart';

abstract class DaftarTransaksiViewModel extends State<DaftarTransaksi> {
  // Add your state and logic here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference transaksi = FirebaseFirestore.instance.collection('transaksi');
  
  

  // Firestore.instance
  //    .collection("users")
  //    .orderBy('createdAt', descending: true or false).getDocuments()
 
}
