import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/features/weather/data/model/weather_model.dart';

abstract interface class IWeatherRemoteDatasource {
  Future<Either<Failure, WeatherModel>> fetchWeather({
    required final double longitude,
    required final double latitude,
  });
}
