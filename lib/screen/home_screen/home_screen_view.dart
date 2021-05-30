import 'package:flutter/material.dart';
import './home_screen_view_model.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            listMenu(
                label: "Masukan Transaksi",
                keterangan:
                    "Kamu bisa melakukan pencatatan transaksi dan penyimpanan",
                tap: () {
                  tapMasukanTransaksi();
                },
                
                ic:  Icon(Icons.add),
                ),
            listMenu(
                label: "Daftar Transaksi",
                keterangan:
                    "Kamu bisa melihat catatan transaksi yang tersimpan",
                tap: () {
                  tapDaftarTransaksi();
                },
                ic:  Icon(Icons.list),
                ),
          ],
        ),
      ),
    );
  }

  Widget listMenu({String label, String keterangan, Function tap, Icon ic}) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ic,
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(keterangan)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
