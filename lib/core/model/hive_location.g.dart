// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLocationAdapter extends TypeAdapter<HiveLocation> {
  @override
  final int typeId = 0;

  @override
  HiveLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLocation(
      locationId: fields[0] as String,
      cityName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLocation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.locationId)
      ..writeByte(1)
      ..write(obj.cityName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
