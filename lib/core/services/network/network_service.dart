import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/core/services/network/i_network_service.dart';

final class NetworkService implements INetworkService {
  NetworkService({required this.dio}) {
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger());
    }
  }

  static const _baseUrl = 'https://api.open-meteo.com/v1';

  final Dio dio;

  @override
  Future<Response<T>> fetchDailyWeather<T>({
    required double latitude,
    required double longitude,
  }) {
    final uri = '$_baseUrl/forecast?latitude=$latitude&longitude=$longitude'
        '&current=&daily=weather_code,temperature_2m_max,temperature_2m_min'
        '&timezone=auto';

    return dio.getUri<T>(Uri.parse(uri));
  }
}
