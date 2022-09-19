import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/controller/controller/student_controller.dart';
import 'package:student/main.dart';
import 'package:student/model/data_model/data_model.dart';
import 'package:student/view/form_widget/widget/text_form_widget.dart';
import 'package:student/view/home/home_screen.dart';
import 'package:student/widget/bottom_sheet.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final domainController = TextEditingController();
final phoneController = TextEditingController();

File? image;

//  // Pick an image
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     // Capture a photo
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

class Formwidget extends StatelessWidget {
  const Formwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblack,
        title: const Text(
          'Add Details',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: GetBuilder<StudentController>(
            init: StudentController(),
            builder: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: data.pickedimagefromGallery != null
                            ? FileImage(File(data.pickedimagefromGallery!))
                                as ImageProvider
                            : const AssetImage('asset/images/No-photo-m.png'),
                        // backgroundImage: AssetImage(''),
                        backgroundColor: kblack,
                      ),
                      Positioned(
                        bottom: 10,
                        right: -10,
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
                ),
                kheight20,
                TextFormWidget(
                  hintText: 'Enter Name',
                  prefixIcon: Icons.person,
                  controller: nameController,
                ),
                kheight,
                TextFormWidget(
                  prefixIcon: Icons.numbers,
                  keyboardType: const TextInputType.numberWithOptions(),
                  hintText: 'Enter Age',
                  controller: ageController,
                ),
                kheight,
                TextFormWidget(
                  prefixIcon: Icons.developer_board,
                  hintText: 'Enter Domain',
                  controller: domainController,
                ),
                kheight,
                TextFormWidget(
                  prefixIcon: Icons.phone_android,
                  keyboardType: const TextInputType.numberWithOptions(),
                  hintText: 'Phone No :',
                  controller: phoneController,
                ),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blueGrey,
                          ),
                        ),
                        onPressed: () {
                          Get.offAll(HomeSceen());
                        },
                        child: const Text(
                          'Cancel',
                        ),
                      ),
                    ),
                    kwidth20,
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            kblack,
                          ),
                        ),
                        onPressed: () {
                          okButtonClicked(context);
                          // controller.update();
                        },
                        child: const Text(
                          'ok',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  final IconData icon;
  final String nameIcon;
  const BottomSheetWidget({
    Key? key,
    required this.icon,
    required this.nameIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        color: kwhite,
      ),
      title: Text(
        nameIcon,
        style: const TextStyle(
          color: kwhite,
        ),
      ),
    );
  }
}

Future<void> okButtonClicked(ctx) async {
  final image =
      stdController.pickedimagefromGallery ?? 'asset/images/No-photo-m.png';
  final name = nameController.text.trim();
  final age = ageController.text.trim();
  final domain = domainController.text.trim();
  final number = phoneController.text.trim();
  // final image = imagefile;
  if (
      // stdController.pickedimagefromGallery!.isEmpty ||
      name.isEmpty || age.isEmpty || domain.isEmpty || number.isEmpty) {
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
  } else {
    final addStudentToDb = Student(
      // id: ,
      studentImage: image,
      studentName: name,
      studentAge: age,
      studentDomain: domain,
      studentPHNumber: number,
    );

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
    stdController.pickedimagefromGallery = null;
    nameController.clear();
    ageController.clear();
    domainController.clear();
    phoneController.clear();
    stdController.addStudentList(
      addStudentToDb,
    );
    // final id = await studentDb.add();

  }
}
