import 'package:flutter/material.dart';
import './daftar_transaksi_view_model.dart';
  
class DaftarTransaksiView extends DaftarTransaksiViewModel {
    
  @override
  Widget build(BuildContext context) {
    
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Transaksi"),),
      body: Container(child: Column(
        children: [],
      ),),
    );
  }
}

