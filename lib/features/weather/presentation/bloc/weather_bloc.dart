import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/get_tracked_location_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.fetchWeatherUseCase,
    required this.getTrackedLocationUseCase,
  }) : super(const WeatherLoadingState()) {
    _subscribeOnFetchWeather();
    _subscribeOnGetTrackedLocation();
  }

  final FetchWeatherUseCase fetchWeatherUseCase;
  final GetTrackedLocationUseCase getTrackedLocationUseCase;

  void _subscribeOnFetchWeather() {
    on<FetchWeatherEvent>(
      (event, emit) async {
        final result = await fetchWeatherUseCase(
          FetchWeatherParams(
            location: event.location,
            locationName: event.locationName,
          ),
        );

        result.fold(
          (l) => emit(WeatherErrorState(error: l.error)),
          (r) => emit(
            WeatherDataState(
              weather: r,
              locationName: event.locationName,
            ),
          ),
        );
      },
    );
  }

  void _subscribeOnGetTrackedLocation() {
    on<GetTrackedLocationWeatherEvent>(
      (event, emit) {
        final response = getTrackedLocationUseCase(const NoParams());

        if (response.location != null && response.locationName != null) {
          add(
            FetchWeatherEvent(
              location: response.location!,
              locationName: response.locationName!,
            ),
          );
        }
      },
    );
  }
}
