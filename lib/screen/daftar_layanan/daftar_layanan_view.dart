import 'package:flutter/material.dart';
import 'package:laundry/utils/app_helper.dart';
import './daftar_layanan_view_model.dart';

class DaftarLayananView extends DaftarLayananViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Layanan"),
      ),
      body: isLoad
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                strokeWidth: 1,
              )),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: listLayanan.map((e) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.call),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['nama_layanan'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Harga ${AppHelper().numberToRupiah(e['harga'])}",
                              ),
                              Text("Pengerjaan")
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
