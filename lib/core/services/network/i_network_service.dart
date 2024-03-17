import 'package:dio/dio.dart';

abstract interface class INetworkService {
  Future<Response<T>> fetchDailyWeather<T>({
    required double latitude,
    required double longitude,
  });
}
