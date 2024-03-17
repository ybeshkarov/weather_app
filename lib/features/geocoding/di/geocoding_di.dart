import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/database/hive_database.dart';
import 'package:weather_app/core/services/geocoding/geocoding_service.dart';
import 'package:weather_app/features/geocoding/data/datasource/local/local_geocoding_datasource.dart';
import 'package:weather_app/features/geocoding/data/datasource/remote/remote_geocoding_datasource.dart';
import 'package:weather_app/features/geocoding/data/repository/geocoding_repository.dart';
import 'package:weather_app/features/geocoding/domain/usecases/geocoding_usecase.dart';
import 'package:weather_app/features/geocoding/presentation/bloc/bloc.dart';

abstract final class GeocodingDi {
  static const _scopeName = 'GeocodingDi';

  static void init() {
    GetIt.instance.pushNewScope(
      scopeName: _scopeName,
      init: (locator) {
        // Datasource
        locator.registerFactory(
          () => LocalGeocodingDatasource(
            databaseService: locator<HiveDatabase>(),
          ),
        );
        locator.registerFactory(
          () => RemoteGeocodingDatasource(
            geocodingService: locator<GeocodingService>(),
          ),
        );

        // Repository
        locator.registerFactory(
          () => GeocodingRepository(
            localDatasource: locator<LocalGeocodingDatasource>(),
            remoteDatasource: locator<RemoteGeocodingDatasource>(),
          ),
        );

        // Use Cases
        locator.registerFactory(
          () => GeocodingUseCase(
            repository: locator<GeocodingRepository>(),
          ),
        );

        // Bloc
        locator.registerLazySingleton(
          () => GeocodingBloc(
            geocodingUseCase: locator(),
          ),
        );
      },
    );
  }

  static void dispose() {
    GetIt.instance.dropScope(_scopeName);
  }
}
