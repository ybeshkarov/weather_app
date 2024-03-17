import 'package:weather_app/features/weather/domain/entities/daily_entity.dart';

class WeatherEntity {
  const WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.daily,
  });

  final double latitude;
  final double longitude;
  final String timezone;
  final DailyEntity daily;
}
