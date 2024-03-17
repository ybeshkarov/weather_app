import 'package:equatable/equatable.dart';

sealed class GeocodingEvent extends Equatable {
  const GeocodingEvent();

  @override
  List<Object?> get props => [];
}

final class FetchLocationNamesEvent extends GeocodingEvent {
  const FetchLocationNamesEvent();
}
