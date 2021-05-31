import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AppHelper {
  numberToRupiah(number) {
    return NumberFormat.currency(locale: 'id', symbol: "Rp ", decimalDigits: 0)
        .format(number);
  }

  millisecondToDay(val) {
    var number = Duration(milliseconds: val);
    return number.inDays;
  }

  static bool isNullOrEmptyString(text) {
    if (text == null || text.isEmpty) {
      return true;
    }
    return false;
  }

   static String formatDateString(Timestamp dateString) {
    DateTime dateTime = DateTime.parse(dateString.toDate().toString());
    var formater = DateFormat('dd MMM yyyy \tHH:mm');
    return formater.format(dateTime);
  }


}
