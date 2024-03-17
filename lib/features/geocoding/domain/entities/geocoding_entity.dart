import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';

class GeocodingEntity {
  const GeocodingEntity({
    required this.location,
    required this.administrativeArea,
  });

  final GeolocationEntity location;
  final String administrativeArea;
}
