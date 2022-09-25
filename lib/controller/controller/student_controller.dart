import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import '../../model/data_model/data_model.dart';

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
  List<Student> list = <Student>[];

  Future<void> getCamera() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.camera);

    pickedimagefromGallery = images!.path;
    update();
  }

  Future<void> getGallery() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    pickedimagefromGallery = images!.path;

    update();
  }

  Future<void> addStudentList(Student data) async {
    final int id = await studentDb.add(data);
    final Student studentdata = Student(
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
  }

  void deleteStudent(int id, int index) {
    studentDb.delete(id);
    list.removeAt(index);
    update();
  }

  Future<void> updateStudent(Student editStudent, int index) async {
    await studentDb.put(stdController.list[index].id, editStudent);
    list.removeAt(index);
    list.insert(index, editStudent);
    update();
  }
}
