import 'package:intl/intl.dart';

class AppFormats {
  AppFormats._internal();

  static AppFormats instance = AppFormats._internal();

  factory AppFormats() {
    return instance;
  }

  final DateFormat formatDay = DateFormat('dd/MM/yyyy');

  final DateFormat formatTime = DateFormat('HH:mm');

  final DateFormat formatDateTime = DateFormat('dd/MM/yyyy -- HH:mm');

  final DateFormat formatTimeAndDate = DateFormat('HH:mm MM/dd');

  final DateFormat formatDateMonthTime = DateFormat('dd MMM yyyy, HH:mm');
}
