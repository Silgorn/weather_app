import 'package:intl/intl.dart';

class Utils {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static String getFullDayOfWeek(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }
}
