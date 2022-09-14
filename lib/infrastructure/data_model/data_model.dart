import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String? studentImage;

  @HiveField(2)
  final String? studentName;

  @HiveField(3)
  final String? studentAge;

  @HiveField(4)
  final String? studentDomain;

  @HiveField(5)
  final String? studentPHNumber;

  Student({
    this.id,
    required this.studentImage,
    required this.studentName,
    required this.studentAge,
    required this.studentDomain,
    required this.studentPHNumber,
  });
}
