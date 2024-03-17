import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/weather_location_constants.dart';
import 'package:weather_app/features/geocoding/domain/entities/geolocation_entity.dart';
import 'package:weather_app/features/geocoding/domain/usecases/geocoding_usecase.dart';
import 'package:weather_app/features/geocoding/presentation/bloc/bloc.dart';

final class GeocodingBloc extends Bloc<GeocodingEvent, GeocodingState> {
  GeocodingBloc({required this.geocodingUseCase})
      : super(const GeocodingIdleState()) {
    _subscribeOnEvents();
  }

  final GeocodingUseCase geocodingUseCase;

  void _subscribeOnEvents() {
    on<FetchLocationNamesEvent>((event, emit) async {
      final results = await Future.wait(
        WeatherLocationConstants.weatherLocations.map(
          (e) => geocodingUseCase(
            GeocodingParams(
              location: e,
            ),
          ),
        ),
      );

      final locations = <String, GeolocationEntity>{};
      final errors = <String>[];

      for (final result in results) {
        result.response.fold((l) => errors.add(l.error), (r) {
          if (r != null) {
            locations[r] = result.location;
          } else {
            errors.add(
              'An empty data from geocoding service for location ${result.location}',
            );
          }
        });
      }

      if (locations.isNotEmpty) {
        emit(LocationNamesDataState(locations: locations));
      }

      if (errors.isNotEmpty) {
        emit(GeocodingErrorState(error: errors.join(', ')));
      }
    });
  }
}
