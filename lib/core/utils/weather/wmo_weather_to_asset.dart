import 'package:weather_app/core/constants/assets.gen.dart';
import 'package:weather_app/core/utils/weather/wmo_weather.dart';

extension WmoWeatherToAsset on WmoWeather {
  String getWeatherIconFromWMO() {
    switch (this) {
      case WmoWeather.clearSky:
        return Assets.icon.clearSky.path;
      case WmoWeather.partlyCloud:
        return Assets.icon.partlyCloud.path;
      case WmoWeather.fog:
        return Assets.icon.fog.path;
      case WmoWeather.drizzle:
      case WmoWeather.freezingDrizzle:
        return Assets.icon.drizzle.path;
      case WmoWeather.rain:
      case WmoWeather.freezingRain:
      case WmoWeather.rainShowers:
        return Assets.icon.rain.path;
      case WmoWeather.snowFall:
      case WmoWeather.snowGrains:
      case WmoWeather.snowShowers:
        return Assets.icon.snow.path;
      case WmoWeather.thunderstorm:
        return Assets.icon.storm.path;
      default:
        return Assets.icon.partlyCloud.path;
    }
  }
}
