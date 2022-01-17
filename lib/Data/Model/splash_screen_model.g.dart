// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SplashScreenModelAdapter extends TypeAdapter<SplashScreenModel> {
  @override
  final int typeId = 0;

  @override
  SplashScreenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SplashScreenModel(
      appName: fields[0] as String?,
      updatedAt: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SplashScreenModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.appName)
      ..writeByte(1)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplashScreenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
