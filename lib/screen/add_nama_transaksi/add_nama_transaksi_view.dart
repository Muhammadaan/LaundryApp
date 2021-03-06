import 'package:flutter/material.dart';
import 'package:laundry/widgets/text_button_custom.dart';
import './add_nama_transaksi_view_model.dart';

class AddNamaTransaksiView extends AddNamaTransaksiViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Transaksi"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "Nama",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
              controller: namaCtrl,
            ),
            SizedBox(height: 20,),
            // TextButton(onPressed: () {
            //   addData();

            // }, child: Text("Simpan"))

            ButtonTextCustom(
              label: "Pilih Layanan",
              press: (){
                tapLayanan();
              },
            )
          ],
        ),
      ),
    );
  }
}
