import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

abstract interface class IRemoteGeocodingDatasource {
  Future<Either<Failure, String?>> fetchAdministrativeAreaByLocation(
    GeolocationModel location,
  );
}
