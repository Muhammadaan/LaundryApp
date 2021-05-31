import 'package:intl/intl.dart';

class AppHelper{

  numberToRupiah(number){
   return  NumberFormat.currency(locale: 'id', symbol: "Rp ", decimalDigits: 0).format(number);
  }
  
   static bool isNullOrEmptyString(text) {
    if (text == null || text.isEmpty) {
      return true;
    }
    return false;
  }


}