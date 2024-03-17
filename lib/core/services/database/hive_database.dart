import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/core/constants/hive_fileds_keys.dart';
import 'package:weather_app/core/services/database/i_database_service.dart';
import 'package:weather_app/features/geocoding/data/model/geocoding_model.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';
import 'package:weather_app/features/weather/data/model/daily_model.dart';
import 'package:weather_app/features/weather/data/model/weather_model.dart';

final class HiveDatabase implements IDatabaseService {
  static const _geocodingBoxKey = 'geocodingBox';
  static const _weatherBoxKey = 'weatherBox';

  late final Box _geocodingBox;
  late final Box _weatherBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(GeocodingModelAdapter());
    Hive.registerAdapter(GeolocationModelAdapter());
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(DailyModelAdapter());

    _geocodingBox = await Hive.openBox(_geocodingBoxKey);
    _weatherBox = await Hive.openBox(_weatherBoxKey);
  }

  @override
  GeocodingModel? fetchGeocodingByLocation(GeolocationModel location) {
    return _geocodingBox.get(location.toString());
  }

  @override
  void saveGeocodingData(GeocodingModel geocoding) {
    _geocodingBox.put(geocoding.location.toString(), geocoding);
  }

  @override
  GeolocationModel? getTrackedLocation() {
    return _weatherBox.get(HiveFieldsKeys.trackedLocation);
  }

  @override
  void saveLocationToTrack(GeolocationModel location) {
    _weatherBox.put(HiveFieldsKeys.trackedLocation, location);
  }

  @override
  String? getTrackedLocationName() {
    return _weatherBox.get(HiveFieldsKeys.trackedLocationName);
  }

  @override
  void saveTrackedLocationName(String locationName) {
    _weatherBox.put(HiveFieldsKeys.trackedLocationName, locationName);
  }
}
