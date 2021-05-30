import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          child: Column(
            children: [
              // FutureBuilder<QuerySnapshot>(
              //     future: users.get(),
              //     builder: (_, snapshot) {
              //       if (snapshot.hasError) {
              //         return Text("Something went wrong");
              //       }

              //       if (snapshot.hasData) {
              //         return Column(
              //           children: snapshot.data.docs.map((e) {
              //             return Text(e['name']);
              //           }).toList(),
              //         );
              //       }

              //       return Text("loading");
              //     })

              StreamBuilder<QuerySnapshot>(
                  stream: users.snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.docs.map((e) {
                          return Text(e['name']);
                        }).toList(),
                      );
                    }

                    return Text("loading");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
