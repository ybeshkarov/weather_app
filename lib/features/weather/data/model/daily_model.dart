import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/constants/hive_ids.dart';
import 'package:weather_app/features/weather/domain/entities/daily_entity.dart';

part 'daily_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: HiveIds.dailyId)
final class DailyModel extends DailyEntity {
  const DailyModel({
    required List<DateTime> time,
    required List<int> weatherCode,
    required List<double> temperature2MMax,
    required List<double> temperature2MMin,
  }) : super(
          time: time,
          weatherCode: weatherCode,
          temperature2MMax: temperature2MMax,
          temperature2MMin: temperature2MMin,
        );

  factory DailyModel.fromJson(Map<String, dynamic> json) =>
      _$DailyModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyModelToJson(this);

  factory DailyModel.fromEntity(DailyEntity entity) => DailyModel(
        time: entity.time,
        weatherCode: entity.weatherCode,
        temperature2MMax: entity.temperature2MMax,
        temperature2MMin: entity.temperature2MMin,
      );

  @override
  @HiveField(0)
  List<DateTime> get time;

  @override
  @HiveField(1)
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode;

  @override
  @HiveField(2)
  @JsonKey(name: 'temperature_2m_max')
  List<double> get temperature2MMax;

  @override
  @HiveField(3)
  @JsonKey(name: 'temperature_2m_min')
  List<double> get temperature2MMin;
}
