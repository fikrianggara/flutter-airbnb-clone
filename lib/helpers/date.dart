import 'package:intl/intl.dart';

String returnMonth(DateTime date) {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des'
  ];
  var now = DateTime.now();
  var currentMon = now.month;
  return months[currentMon - 1];
}

String returnDay(DateTime date) {
  return DateFormat.d().format(date);
}

String returnYear(DateTime date) {
  return DateFormat.y().format(date);
}

String returnDayOfWeek(DateTime date) {
  return DateFormat.EEEE().format(date);
}
