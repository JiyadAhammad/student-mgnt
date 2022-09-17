import 'dart:developer';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:student/main.dart';
import 'package:student/model/data_model/data_model.dart';

class StudentController extends GetxController {
  var list = <Student>[].obs;
  addStudent(Student value) async {
    final id = await studentDb.add(value);
    value.id = id;
    list.add(value);
    // log(value.toString());
    log(value.studentName.toString());
    // studentDb.add(value);
    // list.value.add(value);
    update();
  }

  Future<void> getAllStudents() async {
    list.clear();
    list.addAll(studentDb.values);
    update();
  }

  @override
  void onReady() {
    list.clear();
    list.addAll(studentDb.values);
    super.onReady();
    update();
  }

  Future<void> deleteStudent(int index) async {
    await studentDb.deleteAt(index);
    list.removeAt(index);
    update();
  }
}
