class GeolocationEntity {
  const GeolocationEntity({
    required this.longitude,
    required this.latitude,
  });

  final double longitude;
  final double latitude;

  @override
  String toString() => '$latitude, $longitude';
}
