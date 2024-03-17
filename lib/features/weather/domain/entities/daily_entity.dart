class DailyEntity {
  const DailyEntity({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final List<DateTime> time;
  final List<int> weatherCode;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;
}
