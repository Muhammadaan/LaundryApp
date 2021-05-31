import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry/utils/app_contant.dart';
import 'package:laundry/utils/app_helper.dart';
import 'package:laundry/widgets/text_button_custom.dart';
import './daftar_layanan_view_model.dart';

class DaftarLayananView extends DaftarLayananViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Layanan"),
      ),
      floatingActionButton: jumlahLayanan == 0
          ? null
          : GestureDetector(
              onTap: () {
                nextTransaksi();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$jumlahLayanan Layanan",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: isLoad
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                strokeWidth: 1,
              )),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(bottom: 60),
                child: Column(
                  children: listLayanan.map((e) {
                    return GestureDetector(
                      onTap: () {
                        showModalInput(
                          name: e['nama_layanan'],
                          satuan: e['nama_satuan'],
                          harga: e['harga'],
                          durasi: e['durasi_penyelesaian'],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['nama_layanan'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Harga ${AppHelper().numberToRupiah(e['harga'])}",
                                ),
                                Text(
                                  "Pengerjaan ${AppHelper().millisecondToDay(e['durasi_penyelesaian'])} Hari / ${e['nama_satuan']} ",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }

  void showModalInput({String name, String satuan, int harga, int durasi}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return SingleChildScrollView(
              child: Container(
                  // height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tambah $name"),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Jumlah ($satuan)",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            controller: jumlahCtrl,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ButtonTextCustom(
                            label: "Tambah",
                            press: () {
                              tapTambah(
                                  harga: harga,
                                  jumlah: jumlahCtrl.text,
                                  nama: name,
                                  satuan: satuan,
                                  durasi: AppHelper().millisecondToDay(durasi)
                                  );
                              jumlahCtrl.text = "";
                              Navigator.pop(context);
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  )),
            );
          });
        });
  }
}
