import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String getDateStringFromEpoch(int epoch) {
    final timeStamp = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    return DateFormat('dd/MM').format(timeStamp);
  }
}
