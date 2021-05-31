import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laundry/screen/review_transaksi/review_transaksi.dart';
import './list_cart.dart';

abstract class ListCartViewModel extends State<ListCart> {
  // Add your state and logic here

  List listLayanan = [];
  bool isLoad = true;
  TextEditingController keteranganCtrl = TextEditingController();

  String tanggaTransaksi;
  String tanggalSelesai;
  int durasiPengerjaan = 0;
  String nama ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    var today = DateTime.now();
    tanggaTransaksi = DateFormat('d MMMM yyyy').format(today).toString();
    tanggalSelesai = DateFormat('d MMMM yyyy')
        .format(today.add(Duration(days: this.widget.durasi)))
        .toString();
    durasiPengerjaan = this.widget.durasi;
    nama = this.widget.nama;

    print(this.widget.totalHarga);

    listLayanan.addAll(widget.listlayanan);
    setState(() {
      isLoad = false;
    });
  }

  tapLanjutkan() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ReviewTransaksi(
            nama: nama,
            keterangan: keteranganCtrl.text,
            tanggalSelesai: tanggalSelesai,
            tanggalTransaksi: tanggaTransaksi,
            totalHarga: this.widget.totalHarga,
            durasiPengerjaan: this.widget.durasi ,
            listLayanan: listLayanan,
               
              )),
    );
  }
}
