import 'package:weather_app/core/usecase.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/weather/domain/repository/i_weather_repository.dart';

final class GetTrackedLocationUseCase
    extends UseCase<GetTrackedLocationResponse, NoParams> {
  const GetTrackedLocationUseCase({required this.repository});

  final IWeatherRepository repository;

  @override
  GetTrackedLocationResponse call(NoParams params) {
    return GetTrackedLocationResponse(
      location: repository.getTrackedLocation(),
      locationName: repository.getTrackedLocationName(),
    );
  }
}

final class GetTrackedLocationResponse {
  const GetTrackedLocationResponse({
    required this.location,
    required this.locationName,
  });

  final GeolocationEntity? location;
  final String? locationName;
}
