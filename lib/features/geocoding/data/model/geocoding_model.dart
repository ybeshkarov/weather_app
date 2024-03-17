import 'package:hive/hive.dart';
import 'package:weather_app/core/constants/hive_ids.dart';
import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';
import 'package:weather_app/features/geocoding/domain/entities/geocoding_entity.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';

part 'geocoding_model.g.dart';

@HiveType(typeId: HiveIds.geocodingId)
final class GeocodingModel extends GeocodingEntity {
  const GeocodingModel({
    required GeolocationModel location,
    required String administrativeArea,
  }) : super(
          location: location,
          administrativeArea: administrativeArea,
        );

  @override
  @HiveField(0)
  GeolocationEntity get location;

  @override
  @HiveField(1)
  String get administrativeArea;
}
