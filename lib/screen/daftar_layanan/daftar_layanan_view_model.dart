import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:laundry/screen/list_cart/list_cart.dart';

import 'package:laundry/utils/app_contant.dart';
import './daftar_layanan.dart';

abstract class DaftarLayananViewModel extends State<DaftarLayanan> {
  // Add your state and logic here

  bool isLoad = true;
  List listLayanan = [];
  List listCart = [];
  Map dataList;
  List listLayanan1;
  int jumlahLayanan = 0;
  TextEditingController jumlahCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  Future getHttp() async {
    var dio = Dio();
    // Response response;
    try {
      dio.options.contentType = Headers.formUrlEncodedContentType;

      await dio
          .post(
        url,
        data: {
          'jwt':
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxIjoiIiwibGltaXQiOjEwLCJvZmZzZXQiOjB9.__xPZELiWcXD9Ow3xDspjx08BQr8hACnBEjvIWV4sFo"
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      )
          .then((value) {
        listLayanan.addAll(value.data);
        setState(() {
          isLoad = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  tapTambah({String nama, String satuan, int harga, String jumlah}) {
    listCart.add({
      'nama': nama,
      'satuan': satuan,
      'harga': harga,
      'jumlah': int.parse(jumlah),
      'jumlahtotal' : harga * int.parse(jumlah)
    });

    setState(() {
      jumlahLayanan = listCart.length;
    });

   
  }

  nextTransaksi() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListCart(
                listlayanan: listCart,
              )),
    );
  }
}
