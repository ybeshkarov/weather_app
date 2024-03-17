import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/services/network/i_network_service.dart';
import 'package:weather_app/features/weather/data/datasource/remote/i_weather_remote_datasource.dart';
import 'package:weather_app/features/weather/data/model/weather_model.dart';

final class WeatherRemoteDatasource implements IWeatherRemoteDatasource {
  const WeatherRemoteDatasource({required this.networkService});

  final INetworkService networkService;

  @override
  Future<Either<Failure, WeatherModel>> fetchWeather({
    required final double longitude,
    required final double latitude,
  }) async {
    try {
      final response = await networkService.fetchDailyWeather(
        latitude: latitude,
        longitude: longitude,
      );

      if (response.statusCode == 200) {
        return Right(WeatherModel.fromJson(response.data));
      }

      return Left(
        FailureNetwork(
          error: 'Something went wrong. Status code is ${response.statusCode}',
        ),
      );
    } catch (e) {
      return Left(
        FailureNetwork(
          error: e.toString(),
        ),
      );
    }
  }
}
