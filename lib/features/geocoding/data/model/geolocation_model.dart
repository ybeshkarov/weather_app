import 'package:hive/hive.dart';
import 'package:weather_app/core/constants/hive_ids.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';

part 'geolocation_model.g.dart';

@HiveType(typeId: HiveIds.geolocationId)
final class GeolocationModel extends GeolocationEntity {
  const GeolocationModel({
    required double latitude,
    required double longitude,
  }) : super(latitude: latitude, longitude: longitude);

  @override
  @HiveField(0)
  double get latitude;

  @override
  @HiveField(1)
  double get longitude;
}
