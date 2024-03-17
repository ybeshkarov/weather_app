import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:weather_app/core/services/geocoding/i_geocoding_service.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

final class GeocodingService implements IGeocodingService {
  @override
  Future<List<geocoding.Placemark>> placemarkFromCoordinates(
    GeolocationModel location,
  ) {
    return geocoding.placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );
  }
}
