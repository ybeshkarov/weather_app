import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/services/geocoding/i_geocoding_service.dart';
import 'package:weather_app/features/geocoding/data/datasource/remote/i_remote_geocoding_datasource.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

final class RemoteGeocodingDatasource implements IRemoteGeocodingDatasource {
  const RemoteGeocodingDatasource({required this.geocodingService});

  final IGeocodingService geocodingService;

  @override
  Future<Either<Failure, String?>> fetchAdministrativeAreaByLocation(
    GeolocationModel location,
  ) async {
    try {
      final places = await geocodingService.placemarkFromCoordinates(
        location,
      );

      if (places.isNotEmpty) {
        return Right(places.first.locality);
      }

      return Left(
        FailureError(
          error: 'Geocoding: places for $location is empty',
        ),
      );
    } catch (e) {
      return Left(FailureError(error: e.toString()));
    }
  }
}
