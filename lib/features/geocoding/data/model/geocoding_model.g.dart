// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeocodingModelAdapter extends TypeAdapter<GeocodingModel> {
  @override
  final int typeId = 1;

  @override
  GeocodingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeocodingModel(
      location: fields[0] as GeolocationModel,
      administrativeArea: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeocodingModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.administrativeArea);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeocodingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
