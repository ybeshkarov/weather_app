// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeolocationModelAdapter extends TypeAdapter<GeolocationModel> {
  @override
  final int typeId = 2;

  @override
  GeolocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeolocationModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GeolocationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeolocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
