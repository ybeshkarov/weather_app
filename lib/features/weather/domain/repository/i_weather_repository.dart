import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

abstract interface class IWeatherRepository {
  Future<Either<Failure, WeatherEntity>> fetchWeather(
    GeolocationEntity geolocation,
  );

  void saveLocationToTrack(GeolocationEntity location);

  GeolocationEntity? getTrackedLocation();

  void saveLocationNameToTrack(String locationName);

  String? getTrackedLocationName();
}
