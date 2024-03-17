import 'package:weather_app/features/geocoding/data/model/geocoding_model.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

abstract interface class ILocalGeocodingDatasource {
  GeocodingModel? fetchGeocodingByLocation(GeolocationModel location);

  void saveGeocodingData(GeocodingModel geocoding);
}
