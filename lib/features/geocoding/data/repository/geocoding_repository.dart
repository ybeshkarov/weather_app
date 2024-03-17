import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/features/geocoding/data/datasource/local/i_local_geocoding_datasource.dart';
import 'package:weather_app/features/geocoding/data/datasource/remote/i_remote_geocoding_datasource.dart';
import 'package:weather_app/features/geocoding/data/model/geocoding_model.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';
import 'package:weather_app/features/geocoding/domain/entities/geocoding_entity.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/geocoding/domain/repository/i_geocoding_repository.dart';

final class GeocodingRepository implements IGeocodingRepository {
  const GeocodingRepository({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  final ILocalGeocodingDatasource localDatasource;
  final IRemoteGeocodingDatasource remoteDatasource;

  @override
  Future<Either<Failure, String?>> fetchAdministrativeAreaByLocation(
    GeolocationEntity location,
  ) {
    return remoteDatasource.fetchAdministrativeAreaByLocation(
      GeolocationModel(
        latitude: location.latitude,
        longitude: location.longitude,
      ),
    );
  }

  @override
  GeocodingEntity? fetchGeocodingByLocationLocally(GeolocationEntity location) {
    return localDatasource.fetchGeocodingByLocation(
      GeolocationModel(
        latitude: location.latitude,
        longitude: location.longitude,
      ),
    );
  }

  @override
  void saveGeocodingDataLocally(GeocodingEntity geocoding) {
    localDatasource.saveGeocodingData(
      GeocodingModel(
        location: GeolocationModel(
          latitude: geocoding.location.latitude,
          longitude: geocoding.location.longitude,
        ),
        administrativeArea: geocoding.administrativeArea,
      ),
    );
  }
}
