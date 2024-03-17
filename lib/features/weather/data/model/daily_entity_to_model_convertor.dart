import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/model/daily_model.dart';
import 'package:weather_app/features/weather/domain/entities/daily_entity.dart';

class DailyEntityToModelJsonConverter
    extends JsonConverter<DailyEntity, Map<String, dynamic>> {
  const DailyEntityToModelJsonConverter();

  @override
  DailyEntity fromJson(Map<String, dynamic> json) => DailyModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(DailyEntity object) => DailyModel(
        time: object.time,
        weatherCode: object.weatherCode,
        temperature2MMax: object.temperature2MMax,
        temperature2MMin: object.temperature2MMin,
      ).toJson();
}
