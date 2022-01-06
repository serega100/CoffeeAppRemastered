import 'package:intl/intl.dart';

class OpeningHours {
  static final _hourMinuteFormat = DateFormat('HH:mm');

  final int openHour;
  final int openMinute;
  final int closeHour;
  final int closeMinute;

  OpeningHours.utc({
    required this.openHour,
    required this.openMinute,
    required this.closeHour,
    required this.closeMinute,
  });

  bool get isOpened {
    var now = DateTime.now();
    var openTime = DateTime(now.year, now.month, now.day, openHour, openMinute);
    var closeTime = DateTime(now.year, now.month, now.day, closeHour, closeMinute);
    return now.isAfter(openTime) && now.isBefore(closeTime);
  }

  String get openTimeString => getStringTime(openHour, openMinute);

  String get closeTimeString => getStringTime(closeHour, closeMinute);

  String getStringTime(int utcHour, int utcMinute) {
    var now = DateTime.now();
    var openTime = DateTime(now.year, now.month, now.day, utcHour, utcMinute);
    var local = openTime.toLocal();
    return _hourMinuteFormat.format(local);
  }
}