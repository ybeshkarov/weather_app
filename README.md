# The Weather App

The Weather App is a simple Flutter application that retrieves weather information from the [Open Meteo API](https://open-meteo.com/). It consists of two screens: the Home Screen, where users can select a location from a list, and a detailed page where users can view the weather forecast for the selected location in the upcoming days.

## Location Data Optimization

The list of places available on the Home Screen is sourced from `core/constants/weather_location_constants.dart`. Location names are obtained using a reverse geocoding approach with optimization. Once the geocoding for a specific geolocation is performed, the location name is saved into a local database. Subsequent requests for geocoding with the same location are handled by the local database. However, users still have the option to retrieve data from the geocoding service by passing `forceRemote: true` in the `GeocodingParams` parameter.

```dart
GeocodingParams(location: someLocation, forceRemote: true)
```

## Technologies Used

- **BLoC**: Utilized for state management, providing a structured approach to managing application state.
- **GetIt**: Dependency injection framework used to manage dependencies throughout the application.
- **Dio**: Networking library for making HTTP requests, facilitating communication with the Open Meteo API.
- **Hive**: Local NoSQL database used for efficient storage and retrieval of location data.
- **geocoding**: A Flutter Geocoding plugin utilized for reverse geocoding operations.

## Note

Localization functionality has not been implemented in this version of the app.

## Contributing

Contributions to the Weather App are welcome! If you'd like to contribute, please fork the repository and submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to modify and distribute the code for commercial or non-commercial purposes.