import 'package:weather_app/core/services/database/i_database_service.dart';
import 'package:weather_app/features/geocoding/data/datasource/local/i_local_geocoding_datasource.dart';
import 'package:weather_app/features/geocoding/data/model/geocoding_model.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

final class LocalGeocodingDatasource implements ILocalGeocodingDatasource {
  const LocalGeocodingDatasource({required this.databaseService});

  final IDatabaseService databaseService;

  @override
  GeocodingModel? fetchGeocodingByLocation(GeolocationModel location) {
    return databaseService.fetchGeocodingByLocation(location);
  }

  @override
  void saveGeocodingData(GeocodingModel geocoding) {
    databaseService.saveGeocodingData(geocoding);
  }
}
