extension DateTimeListExtension on List<DateTime> {
  int getDayIndexByTimesList() {
    final now = DateTime.now();
    return indexWhere(
      (element) =>
          element.day == now.day &&
          element.month == now.month &&
          element.year == now.year,
    );
  }
}
