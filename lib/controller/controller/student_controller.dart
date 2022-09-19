import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/main.dart';
import 'package:student/model/data_model/data_model.dart';

class StudentController extends GetxController {
  @override
  void onReady() {
    list.clear();
    list.addAll(studentDb.values);
    update();

    super.onReady();
  }

  String? pickedImage;
  String? pickedimagefromGallery;
  var list = <Student>[];

  getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);

    pickedimagefromGallery = images!.path;
    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
  
    pickedimagefromGallery = images!.path;

    update();
  }

  addStudentList(Student data) async {
    final id = await studentDb.add(data);
    final studentdata = Student(
      id: id,
      studentImage: data.studentImage,
      studentName: data.studentName,
      studentAge: data.studentAge,
      studentDomain: data.studentDomain,
      studentPHNumber: data.studentPHNumber,
    );

    await studentDb.put(id, studentdata);

    list.add(studentdata);

    update();
    log(id.toString());
    log(list.toList().toString());
    log(data.studentAge!);
  }

  deleteStudent(int id, int index) {
    studentDb.delete(id);
    list.removeAt(index);
    update();
    print(index.toString());
  }

  updateStudent(Student editStudent, int index) async {
    await studentDb.put(stdController.list[index].id, editStudent);
    list.removeAt(index);
    list.insert(index, editStudent);
    update();
  }
}
