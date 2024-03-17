import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/database/hive_database.dart';
import 'package:weather_app/core/services/geocoding/geocoding_service.dart';
import 'package:weather_app/core/services/network/network_service.dart';

abstract final class CoreDi {
  static void init() {
    // Networking
    GetIt.instance.registerLazySingleton(
      () => Dio(),
    );
    GetIt.instance.registerLazySingleton(
      () => NetworkService(
        dio: GetIt.instance(),
      ),
    );

    // Database
    GetIt.instance.registerSingletonAsync(() async {
      final hiveDb = HiveDatabase();
      await hiveDb.init();
      return hiveDb;
    });

    // Geocoding
    GetIt.instance.registerLazySingleton(
      () => GeocodingService(),
    );
  }
}
