import 'package:weather_app/features/weather/domain/entities/daily_entity.dart';

extension CalculateTemperature on DailyEntity {
  String getAverageTemperature(int dayIndex) {
    final temperature = temperature2MMin[dayIndex] + temperature2MMax[dayIndex];

    return '${(temperature / 2).toStringAsFixed(0)} °C';
  }
}
