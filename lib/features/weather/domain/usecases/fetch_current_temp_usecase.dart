import 'package:weather_app/core/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/daily_entity.dart';

final class FetchCurrentTempUseCase extends UseCase<String, DailyEntity> {
  @override
  String call(DailyEntity params) {
    return _getTemperature(params);
  }

  String _getTemperature(DailyEntity daily) {
    final dayIndex = _getDayIndexByTimes(daily.time);
    final temperature =
        (daily.temperature2MMin[dayIndex] + daily.temperature2MMax[dayIndex]) /
            2;

    return '${temperature.toStringAsFixed(0)} °C';
  }

  int _getDayIndexByTimes(List<DateTime> time) {
    final now = DateTime.now();
    return time.indexWhere(
      (element) =>
          element.day == now.day &&
          element.month == now.month &&
          element.year == now.year,
    );
  }
}
