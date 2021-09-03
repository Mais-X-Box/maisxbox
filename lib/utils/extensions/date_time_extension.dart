import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedHourAndMinute({String format = "HH:mm"}) {
    return DateFormat(
      format,
    ).format(this).toUpperCase();
  }

  String toFormattedDate({String dateFormat = 'dd/MM/yyyy'}) {
    return DateFormat(
      dateFormat,
    ).format(this).toUpperCase();
  }
}
