import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/color/colors.dart';
import '../../constant/size/sized_box.dart';
import '../../controller/controller/student_controller.dart';
import '../../main.dart';
import '../../model/data_model/data_model.dart';
import '../home/home_screen.dart';
import '../widget/bottom_sheet.dart';
import 'widget/text_form_widget.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController domainController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

File? image;

//  // Pick an image
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     // Capture a photo
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

class Formwidget extends StatelessWidget {
  const Formwidget({super.key});

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
            builder: (StudentController data) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: data.pickedimagefromGallery != null
                            ? FileImage(File(data.pickedimagefromGallery!))
                                as ImageProvider
                            : const AssetImage('asset/images/nophoto.png'),
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
                                  width: 2.0,
                                ),
                              ),
                            );
                          },
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
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
                  hintText: 'Phone No :',
                  controller: phoneController,
                ),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                          okButtonClicked();
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
  const BottomSheetWidget({
    super.key,
    required this.icon,
    required this.nameIcon,
  });
  final IconData icon;
  final String nameIcon;

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

Future<void> okButtonClicked() async {
  final String image =
      stdController.pickedimagefromGallery ?? 'asset/images/nophoto.png';
  final String name = nameController.text.trim();
  final String age = ageController.text.trim();
  final String domain = domainController.text.trim();
  final String number = phoneController.text.trim();
  // final image = imagefile;
  if (name.isEmpty || age.isEmpty || domain.isEmpty || number.isEmpty) {
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
    final Student addStudentToDb = Student(
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
