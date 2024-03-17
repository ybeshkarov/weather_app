import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

final class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
}

final class WeatherErrorState extends WeatherState {
  const WeatherErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

final class WeatherDataState extends WeatherState {
  const WeatherDataState({
    required this.weather,
    required this.locationName,
  });

  final WeatherEntity weather;
  final String locationName;

  @override
  List<Object?> get props => [weather, locationName];
}
