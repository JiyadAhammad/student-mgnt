import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/controller/controller/student_controller.dart';
import 'package:student/main.dart';
import 'package:student/model/data_model/data_model.dart';
import 'package:student/view/form_widget/form_widget.dart';
import 'package:student/view/home/home_screen.dart';
import 'package:student/view/home/widget/serach.dart';
import 'package:student/widget/bottom_sheet.dart';

// ignore: must_be_immutable
class UpdateScreen extends StatelessWidget {
  final int index;
  UpdateScreen({Key? key, required this.index}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _domainController = TextEditingController();
  final _numberController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    _nameController.text = studcontroller.list[index].studentName!;
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
                    return SizedBox(
                      height: 200,
                      width: 200,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          Container(
                            // height: 200,
                            // width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: stdController.pickedimagefromGallery ==
                                          null
                                      ? FileImage(
                                          File(data.list[index].studentImage!))
                                      : FileImage(
                                          File(data.pickedimagefromGallery!)),
                                  fit: BoxFit.contain),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          // CircleAvatar(
                          //   backgroundImage: stdController
                          //               .pickedimagefromGallery ==
                          //           null
                          //       ? FileImage(
                          //           File(data.list[index].studentImage!))
                          //       : FileImage(File(data.pickedimagefromGallery!)),
                          //   // backgroundImage: AssetImage(''),
                          //   backgroundColor: kblack,
                          // ),
                          Positioned(
                            bottom: 10,
                            right: 80,
                            child: RawMaterialButton(
                              onPressed: () {
                                Get.bottomSheet(
                                  const ImageBottomSheet(),
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
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              padding: const EdgeInsets.all(15.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _domainController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kblack),
                ),
                onPressed: () {
                  editButtonListner(context);
                },
                child: const Text(
                  'update',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        )));
  }

  Future<void> editButtonListner(ctx) async {
    final imagefile = stdController.pickedimagefromGallery ??
        stdController.list[index].studentImage;
    final domain = _domainController.text;
    final name = _nameController.text;
    final age = _ageController.text;
    final phnumber = _numberController.text;
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

    _nameController.clear();
    _ageController.clear();
    _domainController.clear();
    _numberController.clear();
  }
}
