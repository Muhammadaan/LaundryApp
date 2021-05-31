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
  List listDurasi = [];
  List listHarga = [];
  int jumlahLayanan = 0;
  int durasi = 0;
  int totalHarga = 0;

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
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxIjoiIiwibGltaXQiOjUwLCJvZmZzZXQiOjB9.UcX7mCCUB6f33MQKtQsruUpHev_XJABY7U8JbqftR9A"
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

  tapTambah(
      {String nama, String satuan, int harga, String jumlah, int durasi}) {
    listCart.add({
      'nama': nama,
      'satuan': satuan,
      'harga': harga,
      'jumlah': int.parse(jumlah),
      'jumlahtotal': harga * int.parse(jumlah),
      'durasitotal': durasi * int.parse(jumlah),
    });

    listHarga.add(harga * int.parse(jumlah));
    listDurasi.add(durasi * int.parse(jumlah));
    listDurasi.sort();
    totalHarga = listHarga.fold(0, (t, e) => t + e);

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
                durasi: listDurasi.last,
                nama: this.widget.nama,
                totalHarga: totalHarga,
              )),
    );
  }
}
