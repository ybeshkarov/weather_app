import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/constants/hive_ids.dart';
import 'package:weather_app/features/weather/data/model/daily_entity_to_model_convertor.dart';
import 'package:weather_app/features/weather/data/model/daily_model.dart';
import 'package:weather_app/features/weather/domain/entities/daily_entity.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: HiveIds.weatherId)
final class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required double latitude,
    required double longitude,
    required String timezone,
    required DailyModel daily,
  }) : super(
          latitude: latitude,
          longitude: longitude,
          timezone: timezone,
          daily: daily,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  factory WeatherModel.fromEntity(WeatherEntity entity) => WeatherModel(
        latitude: entity.latitude,
        longitude: entity.longitude,
        timezone: entity.timezone,
        daily: DailyModel.fromEntity(entity.daily),
      );

  @override
  @HiveField(0)
  double get latitude;

  @override
  @HiveField(1)
  double get longitude;

  @override
  @HiveField(2)
  String get timezone;

  @override
  @HiveField(3)
  @DailyEntityToModelJsonConverter()
  DailyEntity get daily;
}
