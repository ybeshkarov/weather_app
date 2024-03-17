import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/database/hive_database.dart';
import 'package:weather_app/core/services/network/network_service.dart';
import 'package:weather_app/features/weather/data/datasource/local/weather_local_datasource.dart';
import 'package:weather_app/features/weather/data/datasource/remote/weather_remote_datasource.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/fetch_weather_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/get_tracked_location_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/bloc.dart';

final class WeatherDI {
  static const _scopeName = 'WeatherDI';

  static void init() {
    GetIt.instance.pushNewScope(
      scopeName: _scopeName,
      init: (locator) {
        // Data Sources
        locator.registerFactory(
          () => WeatherLocalDatasource(
            databaseService: locator<HiveDatabase>(),
          ),
        );
        locator.registerFactory(
          () => WeatherRemoteDatasource(
            networkService: locator<NetworkService>(),
          ),
        );

        // Repository
        locator.registerFactory(
          () => WeatherRepository(
            remoteDatasource: locator<WeatherRemoteDatasource>(),
            localDatasource: locator<WeatherLocalDatasource>(),
          ),
        );

        // Use Cases
        locator.registerFactory(
          () => FetchWeatherUseCase(
            repository: locator<WeatherRepository>(),
          ),
        );
        locator.registerFactory(
          () => GetTrackedLocationUseCase(
            repository: locator<WeatherRepository>(),
          ),
        );

        // Bloc
        locator.registerLazySingleton(
          () => WeatherBloc(
            fetchWeatherUseCase: locator(),
            getTrackedLocationUseCase: locator(),
          ),
        );
      },
    );
  }

  static void dispose() {
    GetIt.instance.dropScope(_scopeName);
  }
}
