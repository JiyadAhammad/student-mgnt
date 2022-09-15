import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student/main.dart';
import 'package:student/model/data_model/data_model.dart';

class StudentController extends GetxController {
  var list = <Student>[].obs;
  addStudent(Student value) {
     studentDb.add(value);
    list.value.add(value);
  }
}
