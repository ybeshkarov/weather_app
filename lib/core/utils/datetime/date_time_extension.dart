extension DateTimeExtension on DateTime {
  static const weekdayText = <int, String>{
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  };

  String weekdayName() {
    return weekday != DateTime.now().weekday ? weekdayText[weekday]! : 'Today';
  }

  String formatTime() {
    int localHour = hour;

    final amPm = localHour < 12 ? 'AM' : 'PM';

    if (localHour > 12) {
      localHour -= 12;
    }

    final formattedHour = localHour.toString().padLeft(2, '0');
    final formattedMinute = minute.toString().padLeft(2, '0');

    return '$formattedHour:$formattedMinute $amPm';
  }
}
