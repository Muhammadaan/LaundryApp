import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:laundry/screen/daftar_layanan/daftar_layanan.dart';
import 'package:laundry/utils/app_helper.dart';
import './add_nama_transaksi.dart';

abstract class AddNamaTransaksiViewModel extends State<AddNamaTransaksi> {
  // Add your state and logic here

  TextEditingController namaCtrl = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  addData() {
    users.add({"name": namaCtrl.text});
    namaCtrl.text = "";
  }

  tapLayanan() {
    if (AppHelper.isNullOrEmptyString(namaCtrl.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: const Text('Nama wajib di isi'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DaftarLayanan(
                  nama: namaCtrl.text,
                )),
      );
    }
  }
}
