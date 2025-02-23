import 'package:intl/intl.dart';

class Formatter {
  static String dateMonthYear(DateTime dateTime) =>
      DateFormat.yMMMMd().format(dateTime.toLocal());

  static String dayDateMonthYear(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime.toLocal());

  static String hoursMinutes(DateTime dateTime) =>
      DateFormat.Hm().format(dateTime.toLocal());

  static String fullDateTime(DateTime dateTime) {
    final String date = dayDateMonthYear(dateTime);
    final String time = hoursMinutes(dateTime);

    return '$date $time';
  }

  static String daysAgo(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final int days = now.difference(dateTime).inDays;

    if (days == 0) {
      return 'Today';
    } else if (days == 1) {
      return 'Yesterday';
    } else {
      return '$days days ago';
    }
  }

  static String fileSize(int size) {
    if (size < 1024) {
      return '$size B';
    } else if (size < 1024 * 1024) {
      return '${size ~/ 1024} KB';
    } else {
      return '${size ~/ (1024 * 1024)} MB';
    }
  }
}
