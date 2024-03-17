import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/core/usecase.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/features/weather/domain/repository/i_weather_repository.dart';

final class FetchWeatherUseCase extends UseCase<
    Future<Either<Failure, WeatherEntity>>, FetchWeatherParams> {
  const FetchWeatherUseCase({required this.repository});

  final IWeatherRepository repository;

  @override
  Future<Either<Failure, WeatherEntity>> call(FetchWeatherParams params) {
    repository.saveLocationToTrack(params.location);
    repository.saveLocationNameToTrack(params.locationName);

    return repository.fetchWeather(params.location);
  }
}

final class FetchWeatherParams {
  const FetchWeatherParams({
    required this.location,
    required this.locationName,
  });

  final GeolocationEntity location;
  final String locationName;
}

final class FetchWeatherResponse {
  const FetchWeatherResponse(this.response);

  final Future<Either<Failure, WeatherEntity>> response;
}
