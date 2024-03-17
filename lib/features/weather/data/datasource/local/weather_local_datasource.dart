import 'package:weather_app/core/services/database/i_database_service.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';
import 'package:weather_app/features/weather/data/datasource/local/i_weather_local_datasource.dart';

final class WeatherLocalDatasource implements IWeatherLocalDatasource {
  const WeatherLocalDatasource({required this.databaseService});

  final IDatabaseService databaseService;

  @override
  GeolocationModel? getTrackedLocation() {
    return databaseService.getTrackedLocation();
  }

  @override
  void saveLocationToTrack(GeolocationModel location) {
    databaseService.saveLocationToTrack(location);
  }

  @override
  String? getTrackedLocationName() {
    return databaseService.getTrackedLocationName();
  }

  @override
  void saveTrackedLocationName(String locationName) {
    databaseService.saveTrackedLocationName(locationName);
  }
}
