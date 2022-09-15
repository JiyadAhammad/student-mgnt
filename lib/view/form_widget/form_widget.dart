import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/controller/controller/image_controller.dart';
import 'package:student/view/form_widget/widget/text_form_widget.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final domainController = TextEditingController();
final phoneController = TextEditingController();
// final controller = Get.put(ImageController());
// final picker = ImagePicker();

//  // Pick an image
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     // Capture a photo
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

final _formKey = GlobalKey<FormState>();

class Formwidget extends StatelessWidget {
  const Formwidget({Key? key}) : super(key: key);

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
          child: GetBuilder<ImageController>(
            init: ImageController(),
            builder: (controller) => Column(
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
                        backgroundImage: controller.imagefile != null
                            ? FileImage(File(controller.imagefile!.path))
                                as ImageProvider
                            : const AssetImage(''),
                        // backgroundImage: AssetImage(''),
                        backgroundColor: kblack,
                      ),
                      Positioned(
                        bottom: 10,
                        right: -10,
                        child: RawMaterialButton(
                          onPressed: () {
                            Get.bottomSheet(
                              SizedBox(
                                height: 120,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    ListTile(
                                      onTap: () async {
                                        controller.takePhotoFromSource(
                                            ImageSource.camera);
                                        Get.back();
                                        controller.update();
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
                                        controller.takePhotoFromSource(
                                            ImageSource.gallery);
                                        Get.back();
                                        controller.update();
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
                  prefixIcon: Icons.domain_verification,
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
                          Get.back();
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

okButtonClicked() async {
  final name = nameController.text.trim();
  final age = ageController.text.trim();
  final domain = domainController.text.trim();
  final number = phoneController.text.trim();
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
    return;
  } else {
    Get.snackbar(
      'title',
      'message',
      titleText: const Center(
        child: Text(
          'Success',
          style: TextStyle(
            fontSize: 20,
            color: kred,
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
    Get.back();
  }
}
