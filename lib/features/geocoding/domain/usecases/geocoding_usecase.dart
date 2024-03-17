import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/usecase.dart';
import 'package:weather_app/features/geocoding/domain/entities/geocoding_entity.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/geocoding/domain/repository/i_geocoding_repository.dart';

final class GeocodingUseCase
    extends UseCase<Future<GeocodingResult>, GeocodingParams> {
  const GeocodingUseCase({required this.repository});

  final IGeocodingRepository repository;

  @override
  Future<GeocodingResult> call(GeocodingParams params) async {
    if (!params.forceRemote) {
      final locallyCachedData =
          repository.fetchGeocodingByLocationLocally(params.location);

      if (locallyCachedData != null) {
        return GeocodingResult(
          Right(locallyCachedData.administrativeArea),
          location: params.location,
        );
      }
    }

    final remoteData =
        await repository.fetchAdministrativeAreaByLocation(params.location);
    if (remoteData.isRight()) {
      final right = remoteData.getOrElse(() => null);
      if (right != null) {
        repository.saveGeocodingDataLocally(
          GeocodingEntity(
            location: params.location,
            administrativeArea: right,
          ),
        );
      }
    }

    return GeocodingResult(remoteData, location: params.location);
  }
}

class GeocodingParams {
  GeocodingParams({required this.location, this.forceRemote = false});

  final GeolocationEntity location;
  final bool forceRemote;
}

class GeocodingResult {
  const GeocodingResult(this.response, {required this.location});

  final Either<Failure, String?> response;
  final GeolocationEntity location;
}
