// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 1;

  @override
  Student read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      id: fields[0] as int?,
      studentImage: fields[1] as String?,
      studentName: fields[2] as String?,
      studentAge: fields[3] as String?,
      studentDomain: fields[4] as String?,
      studentPHNumber: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentImage)
      ..writeByte(2)
      ..write(obj.studentName)
      ..writeByte(3)
      ..write(obj.studentAge)
      ..writeByte(4)
      ..write(obj.studentDomain)
      ..writeByte(5)
      ..write(obj.studentPHNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
