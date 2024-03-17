import 'package:weather_app/features/geocoding/data/model/geolocation_model.dart';

abstract final class WeatherLocationConstants {
  static const weatherLocations = [
    // Kyiv
    GeolocationModel(
      latitude: 50.450382113699995,
      longitude: 30.524328859908643,
    ),
    // Odesa
    GeolocationModel(
      latitude: 46.474211786659865,
      longitude: 30.718736449652315,
    ),
    // Mykolaiv
    GeolocationModel(
      latitude: 46.964727912875034,
      longitude: 32.002686698012134,
    ),
    // Kryvyi Rih
    GeolocationModel(
      latitude: 47.89976409197898,
      longitude: 33.39760582374289,
    ),
    // Kharkiv
    GeolocationModel(
      latitude: 50.00128603893851,
      longitude: 36.30720752270769,
    ),
    // Lviv
    GeolocationModel(
      latitude: 49.836999159254056,
      longitude: 24.029471866453154,
    ),
    // LA
    GeolocationModel(
      latitude: 34.05385091545048,
      longitude: -118.25568268893622,
    ),
  ];
}
