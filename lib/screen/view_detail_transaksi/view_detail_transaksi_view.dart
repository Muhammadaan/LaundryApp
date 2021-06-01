import 'package:flutter/material.dart';
import 'package:laundry/utils/app_contant.dart';
import 'package:laundry/utils/app_helper.dart';
import './view_detail_transaksi_view_model.dart';

class ViewDetailTransaksiView extends ViewDetailTransaksiViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FutureBuilder(
                  future: transaksi.doc(this.widget.idDoc).get(),
                  builder: (_, snaphhot) {
                    if (snaphhot.hasData) {
                      lislayanan.addAll(snaphhot.data['listLayanan']);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(snaphhot.data['nama']),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Layanan :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: lislayanan.map((e) {
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
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              AppHelper().numberToRupiah(
                                                  e['jumlahtotal']),
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
                          Text(
                            "Durasi Pengerjaan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "${snaphhot.data['durasiPengerjaan'].toString()} hari"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tanggal Transaksi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(snaphhot.data['tanggaTransaksi']),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tanggal Selesai",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(snaphhot.data['tanggalSelesai']),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Total Tagihan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(AppHelper()
                              .numberToRupiah(snaphhot.data['totalHarga'])),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Keterangan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(snaphhot.data['keterangan']),
                        ],
                      );
                    }
                    return Text("Loading");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
