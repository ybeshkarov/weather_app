import 'package:geocoding/geocoding.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

abstract interface class IGeocodingService {
  Future<List<Placemark>> placemarkFromCoordinates(GeolocationModel location);
}
