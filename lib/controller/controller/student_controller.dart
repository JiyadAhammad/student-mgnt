import 'dart:developer';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/main.dart';
import 'package:student/model/data_model/data_model.dart';
import 'package:student/view/home/widget/serach.dart';

class StudentController extends GetxController {
  var list = <Student>[];
  addStudent(Student value) async {
    final id = await studentDb.add(value);
    value.id = id;
    list.add(value);
    // log(value.toString());
    log(value.studentName.toString());
    // studentDb.add(value);
    // list.value.add(value);
    getAllStudents();
    update();
  }

  String? pickedImage;
  String? pickedimagefromGallery;
  // var list = <Student>[];

  getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);

    pickedimagefromGallery = images!.path;
    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (images == null) {
      print('aaaa');
    }
    pickedimagefromGallery = images!.path;

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

  @override
  void onInit() {
    getAllStudents();
    super.onInit();
  }

  updateStudent(Student editStudent, int index) async {
    await studentDb.put(studcontroller.list[index].id, editStudent);
    list.removeAt(index);
    list.insert(index, editStudent);
    update();
  }
}
