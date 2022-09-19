import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/controller/controller/image_controller.dart';
import 'package:student/controller/controller/student_controller.dart';
import 'package:student/model/data_model/data_model.dart';
import 'package:student/view/form_widget/form_widget.dart';
import 'package:student/view/home/home_screen.dart';
import 'package:student/view/home/widget/serach.dart';

final imgController = Get.put(ImageController());

// ignore: must_be_immutable
class UpdateScreen extends StatelessWidget {
  UpdateScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  final _nameController1 = TextEditingController();

  final _ageController = TextEditingController();
  final _domainController = TextEditingController();
  final _numberController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    print('ssssss');

    _nameController1.text = studcontroller.list[index].studentName!;
    _ageController.text = studcontroller.list[index].studentAge!;
    _domainController.text = studcontroller.list[index].studentDomain!;
    _numberController.text = studcontroller.list[index].studentPHNumber!;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit student'),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GetBuilder<StudentController>(
                  init: StudentController(),
                  builder: (data) {
                    return CircleAvatar(
                      backgroundImage: imgController.imagefile != null
                          ? FileImage(File(imgController.imagefile!.path))
                              as ImageProvider
                          : const AssetImage('asset/images/No-photo-m.png'),
                      // backgroundImage: AssetImage(''),
                      backgroundColor: kblack,
                      radius: 100,
                      child: IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            SizedBox(
                              height: 120,
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      imgController.takePhotoFromSource(
                                          ImageSource.camera);
                                      Get.back();
                                      imgController.update();
                                    },
                                    leading: const Icon(
                                      Icons.add_a_photo,
                                      color: kwhite,
                                    ),
                                    title: const Text(
                                      'Camera',
                                      style: TextStyle(
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      imgController.takePhotoFromSource(
                                          ImageSource.gallery);
                                      Get.back();
                                      imgController.update();
                                    },
                                    leading: const Icon(
                                      Icons.collections,
                                      color: kwhite,
                                    ),
                                    title: const Text(
                                      'Galley',
                                      style: TextStyle(
                                        color: kwhite,
                                      ),
                                    ),
                                  ),
                                  // BottomSheetWidget(
                                  //   icon: Icons.add_a_photo,
                                  //   nameIcon: 'Camera',
                                  // ),
                                  // BottomSheetWidget(
                                  //   icon: Icons.collections,
                                  //   nameIcon: 'Galley',
                                  // )
                                  // ListTile(
                                  //   onTap: () {},
                                  //   leading: const Icon(
                                  //     Icons.collections,
                                  //     color: kwhite,
                                  //   ),
                                  //   title: const Text(
                                  //     'Gallery',
                                  //     style: TextStyle(
                                  //       color: kwhite,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // barrierColor: kgrey,
                            backgroundColor: kblack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: kwhite,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_photo_alternate_outlined),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _nameController1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _domainController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    editButtonListner(context);
                  },
                  child: const Text('update')),
            ),
          ],
        )));
  }

  Future<void> editButtonListner(ctx) async {
    final imagefile = imgController.imagefile!.path.toString();
    final domain = _domainController.text.trim();
    final name = _nameController1.text.trim();
    final age = _ageController.text.trim();
    final phnumber = _numberController.text.trim();
    if (name.isEmpty || age.isEmpty || domain.isEmpty || phnumber.isEmpty) {
      Get.snackbar(
        'Warning',
        'All Field are Required',
        titleText: const Center(
          child: Text(
            'Warning',
            style: TextStyle(
              fontSize: 20,
              color: kred,
            ),
          ),
        ),
        messageText: const Center(
          child: Text(
            'All Field are Required',
            style: TextStyle(
              fontSize: 18,
              color: kwhite,
            ),
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kblack,
        colorText: kwhite,
        maxWidth: 250,
        margin: const EdgeInsets.only(bottom: 15),
      );
      return;
    }
    {
      Get.offAll(() => HomeSceen());
      Get.snackbar(
        'title',
        'message',
        titleText: const Center(
          child: Text(
            'Success',
            style: TextStyle(
              fontSize: 20,
              color: kgreen,
            ),
          ),
        ),
        messageText: const Center(
          child: Text(
            'Successfully Added',
            style: TextStyle(
              fontSize: 18,
              color: kwhite,
            ),
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kblack,
        colorText: kwhite,
        maxWidth: 250,
        margin: const EdgeInsets.only(bottom: 15),
      );
      final editStudent = Student(
        id: studcontroller.list[index].id,
        studentImage: imagefile,
        studentName: name,
        studentAge: age,
        studentDomain: domain,
        studentPHNumber: phnumber,
      );
      studcontroller.updateStudent(editStudent, index);
    }
    //  } else {
    //   final editStudent = Student(
    //     id: studcontroller.list[index].id,
    //     studentImage: imagefile,
    //     studentName: name,
    //     studentAge: age,
    //     studentDomain: domain,
    //     studentPHNumber: phnumber,
    //   );
    // final editStudent = Student(
    //     id: controller.list[index].id,
    //     name: name,
    //     image: imagefile,
    //     age: age,
    //     domain: branch,
    //     phnumber: year);
    // Get.snackbar('✅', 'Added successfull',
    //     snackPosition: SnackPosition.BOTTOM,
    //     colorText: Colors.green,
    //     backgroundColor: Colors.black);
    // studcontroller.updateStudent(editStudent, index);

    // _nameController1.clear();
    // _ageController.clear();
    // _domainController.clear();
    // _numberController.clear();
  }
}
