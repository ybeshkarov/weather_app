import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/features/geocoding/domain/entities/geocoding_entity.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';

abstract interface class IGeocodingRepository {
  Future<Either<Failure, String?>> fetchAdministrativeAreaByLocation(
    GeolocationEntity location,
  );

  GeocodingEntity? fetchGeocodingByLocationLocally(GeolocationEntity location);

  void saveGeocodingDataLocally(GeocodingEntity geocoding);
}
