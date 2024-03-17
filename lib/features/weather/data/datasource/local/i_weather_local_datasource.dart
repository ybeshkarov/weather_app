import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

abstract interface class IWeatherLocalDatasource {
  void saveLocationToTrack(GeolocationModel location);

  GeolocationModel? getTrackedLocation();

  String? getTrackedLocationName();

  void saveTrackedLocationName(String locationName);
}
