import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/weather/data/datasource/local/i_weather_local_datasource.dart';
import 'package:weather_app/features/weather/data/datasource/remote/i_weather_remote_datasource.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repository/i_weather_repository.dart';

final class WeatherRepository implements IWeatherRepository {
  const WeatherRepository({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  final IWeatherRemoteDatasource remoteDatasource;
  final IWeatherLocalDatasource localDatasource;

  @override
  Future<Either<Failure, WeatherEntity>> fetchWeather(
    GeolocationEntity geolocation,
  ) {
    return remoteDatasource.fetchWeather(
      longitude: geolocation.longitude,
      latitude: geolocation.latitude,
    );
  }

  @override
  GeolocationEntity? getTrackedLocation() {
    return localDatasource.getTrackedLocation();
  }

  @override
  void saveLocationToTrack(GeolocationEntity location) {
    localDatasource.saveLocationToTrack(
      GeolocationModel(
        latitude: location.latitude,
        longitude: location.longitude,
      ),
    );
  }

  @override
  String? getTrackedLocationName() {
    return localDatasource.getTrackedLocationName();
  }

  @override
  void saveLocationNameToTrack(String locationName) {
    localDatasource.saveTrackedLocationName(locationName);
  }
}
