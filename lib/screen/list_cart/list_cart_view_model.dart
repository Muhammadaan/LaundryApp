import 'package:flutter/material.dart';
import './list_cart.dart';

abstract class ListCartViewModel extends State<ListCart> {
  // Add your state and logic here

  List listLayanan = [];
  bool isLoad = true;
  TextEditingController keteranganCtrl = TextEditingController();

  String tanggaTransaksi;
  String tanggalSelesai;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    listLayanan.addAll(widget.listlayanan);
    setState(() {
      isLoad = false;
    });
  }
}
