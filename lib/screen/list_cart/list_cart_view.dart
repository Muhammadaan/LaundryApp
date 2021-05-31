import 'package:flutter/material.dart';
import 'package:laundry/utils/app_contant.dart';
import 'package:laundry/utils/app_helper.dart';
import 'package:laundry/widgets/date_picker_custom.dart';
import 'package:laundry/widgets/text_button_custom.dart';
import './list_cart_view_model.dart';

class ListCartView extends ListCartViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Masukan Transaksi"),
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
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "Layanan :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: listLayanan.map((e) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
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
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['nama'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        e['jumlah'].toString(),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        e['satuan'],
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        AppHelper()
                                            .numberToRupiah(e['jumlahtotal']),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                      DatePickerCustom(
                        title: "Tanggal Transaksi",
                        hint: "Tanggal",
                        initialValue: tanggaTransaksi,
                        onResult: (value) {
                          setState(() {
                            tanggaTransaksi = value;
                            print(value);
                          });
                        }),
                        SizedBox(
                          height: 10,
                        ),
                    DatePickerCustom(
                        title: "Tanggal Selesai",
                        hint: "Tanggal",
                        initialValue: tanggalSelesai,
                        onResult: (value) {
                          setState(() {
                            tanggalSelesai = value;
                            print(value);
                          });
                        }),
                    TextField(
                      controller: keteranganCtrl,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),
                        labelText: "Keterangan",floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonTextCustom(
                      label: "Lanjutkan",
                      press: () {},
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
