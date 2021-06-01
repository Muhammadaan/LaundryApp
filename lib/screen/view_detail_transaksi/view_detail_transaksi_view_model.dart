import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './view_detail_transaksi.dart';

abstract class ViewDetailTransaksiViewModel extends State<ViewDetailTransaksi> {
  // Add your state and logic here
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference transaksi =
      FirebaseFirestore.instance.collection('transaksi');
      List lislayanan= [];

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      print(this.widget.idDoc);
    }
}
