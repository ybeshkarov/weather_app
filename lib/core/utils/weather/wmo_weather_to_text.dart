import 'package:weather_app/core/utils/weather/wmo_weather.dart';

extension WmoWeatherToString on WmoWeather {
  String wmoToString() {
    switch (this) {
      case WmoWeather.clearSky:
        return 'Clear Sky';
      case WmoWeather.partlyCloud:
        return 'Partly Cloud';
      case WmoWeather.fog:
        return 'Fog';
      case WmoWeather.drizzle:
        return 'Drizzle';
      case WmoWeather.freezingDrizzle:
        return 'Freezing Drizzle';
      case WmoWeather.rain:
        return 'Rainy';
      case WmoWeather.freezingRain:
        return 'Rain';
      case WmoWeather.rainShowers:
        return 'Rain Shower';
      case WmoWeather.snowFall:
        return 'Snow Fall';
      case WmoWeather.snowGrains:
        return 'Snow Grains';
      case WmoWeather.snowShowers:
        return 'Snow Showers';
      case WmoWeather.thunderstorm:
        return 'Thunderstorm';
      default:
        return 'Unknown';
    }
  }
}
