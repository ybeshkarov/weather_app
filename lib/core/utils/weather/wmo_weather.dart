enum WmoWeather {
  clearSky,
  partlyCloud,
  fog,
  drizzle,
  freezingDrizzle,
  rain,
  freezingRain,
  snowFall,
  snowGrains,
  rainShowers,
  snowShowers,
  thunderstorm,
  unknown;

  static WmoWeather getWMOFromCode(int wmoCode) {
    switch (wmoCode) {
      case 0:
        return WmoWeather.clearSky;
      case 1:
      case 2:
      case 3:
        return WmoWeather.partlyCloud;
      case 45:
      case 48:
        return WmoWeather.fog;
      case 51:
      case 53:
      case 55:
        return WmoWeather.drizzle;
      case 56:
      case 57:
        return WmoWeather.freezingDrizzle;
      case 61:
      case 63:
      case 65:
        return WmoWeather.rain;
      case 66:
      case 67:
        return WmoWeather.freezingRain;
      case 71:
      case 73:
      case 75:
        return WmoWeather.snowFall;
      case 77:
        return WmoWeather.snowGrains;
      case 80:
      case 81:
      case 82:
        return WmoWeather.rainShowers;
      case 85:
      case 86:
        return WmoWeather.snowShowers;
      case 95:
      case 96:
      case 99:
        return WmoWeather.thunderstorm;
      default:
        return WmoWeather.unknown;
    }
  }
}
