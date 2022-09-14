import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/presentation/form_widget/widget/text_form_widget.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final domainController = TextEditingController();
final phoneController = TextEditingController();

final picker = ImagePicker();
//  // Pick an image
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     // Capture a photo
//     final XFile? photo = await picker.pickImage(source: ImageSource.camera);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    const CircleAvatar(
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
                                      // Capture a photo
                                      final XFile? photo =
                                          await picker.pickImage(
                                              source: ImageSource.camera);
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
                                      // Pick an image
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);
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
                      onPressed: () {},
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
