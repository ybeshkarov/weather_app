import 'package:equatable/equatable.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

final class FetchWeatherEvent extends WeatherEvent {
  const FetchWeatherEvent({
    required this.location,
    required this.locationName,
  });

  final GeolocationEntity location;
  final String locationName;

  @override
  List<Object?> get props => [location, locationName];
}

final class GetTrackedLocationWeatherEvent extends WeatherEvent {
  const GetTrackedLocationWeatherEvent();
}
