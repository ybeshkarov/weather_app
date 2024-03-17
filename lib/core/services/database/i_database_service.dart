import 'package:weather_app/features/geocoding/data/model/geocoding_model.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

abstract interface class IDatabaseService {
  Future<void> init();

  GeocodingModel? fetchGeocodingByLocation(GeolocationModel location);

  void saveGeocodingData(GeocodingModel geocoding);

  void saveLocationToTrack(GeolocationModel location);

  GeolocationModel? getTrackedLocation();

  String? getTrackedLocationName();

  void saveTrackedLocationName(String locationName);
}
