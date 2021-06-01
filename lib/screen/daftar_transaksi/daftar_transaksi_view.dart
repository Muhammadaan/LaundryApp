import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laundry/utils/app_contant.dart';
import 'package:laundry/utils/app_helper.dart';
import './daftar_transaksi_view_model.dart';

class DaftarTransaksiView extends DaftarTransaksiViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Transaksi"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: transaksi
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.docs.map((e) {
                          return GestureDetector(
                            onTap: () {
                              tapDetail(id: e.id);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      icWasher,
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e['nama'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Dibuat : " +
                                              AppHelper.formatDateString(
                                                  e['createdAt']),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "Selesai : " + e['tanggalSelesai'],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "Total Tagihan : " +
                                              AppHelper().numberToRupiah(
                                                  e['totalHarga']),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        }).toList(),
                      );
                    }

                    return Center(child: Text("Loading"));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
