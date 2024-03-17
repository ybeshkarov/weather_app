import 'package:equatable/equatable.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';

sealed class GeocodingState extends Equatable {
  const GeocodingState();

  @override
  List<Object?> get props => [];
}

final class LocationNamesDataState extends GeocodingState {
  const LocationNamesDataState({required this.locations});

  final Map<String, GeolocationEntity> locations;

  @override
  List<Object?> get props => [locations];
}

final class GeocodingIdleState extends GeocodingState {
  const GeocodingIdleState();
}

final class GeocodingErrorState extends GeocodingState {
  const GeocodingErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
