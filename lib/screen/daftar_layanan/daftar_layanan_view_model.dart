import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:laundry/utils/app_contant.dart';
import './daftar_layanan.dart';

abstract class DaftarLayananViewModel extends State<DaftarLayanan> {
  // Add your state and logic here

  bool isLoad = true;
  List listLayanan = [];
  Map dataList;
  List listLayanan1; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  Future getHttp() async {
    var dio = Dio();
    // Response response;
    try {
      dio.options.contentType = Headers.formUrlEncodedContentType;

      await dio
          .post(
        url,
        data: {
          'jwt':
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxIjoiIiwibGltaXQiOjEwLCJvZmZzZXQiOjB9.__xPZELiWcXD9Ow3xDspjx08BQr8hACnBEjvIWV4sFo"
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      )
          .then((value) {
            print(value);
            print("===Value===");
        
        // list.

          // listLayanan.add(value);
          listLayanan.addAll(value.data);
      
          print("====");

          print(listLayanan);

        setState(() {
          isLoad = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
