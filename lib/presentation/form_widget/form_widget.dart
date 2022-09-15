import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/presentation/form_widget/widget/test_form.dart';
import 'package:student/presentation/form_widget/widget/text_form_widget.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final domainController = TextEditingController();
final phoneController = TextEditingController();

final picker = ImagePicker();
XFile? imagefile;
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
          child: Form(
            key: _formKey,
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
                                        takePhotoFromSource(ImageSource.camera);
                                        Get.back();
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
                                        takePhotoFromSource(
                                            ImageSource.gallery);
                                        Get.back();
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
                // TextFormWidget(
                //   hintText: 'Enter Name',
                //   prefixIcon: Icons.person,
                //   controller: nameController,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.allow(
                //       RegExp(r"[a-zA-Z]+|\s"),
                //     )
                //   ],
                //   validator: (val) {
                //     if (!val!.isNameValidation) return 'Enter valid name';
                //   },
                // ),
                // kheight,
                // TextFormWidget(
                //   prefixIcon: Icons.numbers,
                //   keyboardType: const TextInputType.numberWithOptions(),
                //   hintText: 'Enter Age',
                //   controller: ageController,
                //   validator: (val) {
                //     if (!val!.isAgeValidation) return 'Enter valid name';
                //   },
                // ),
                // kheight,
                // TextFormWidget(
                //   prefixIcon: Icons.domain_verification,
                //   hintText: 'Enter Domain',
                //   controller: domainController,
                // ),
                // kheight,
                // TextFormWidget(
                //   prefixIcon: Icons.phone_android,
                //   keyboardType: const TextInputType.numberWithOptions(),
                //   hintText: 'Phone No :',
                //   controller: phoneController,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.allow(
                //       RegExp(r"[0-9]"),
                //     )
                //   ],
                //   validator: (val) {
                //     if (!val!.isPhoneValidation) return 'Enter valid phone';
                //   },
                // ),
                CustomFormField(
                  hintText: 'Name',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isValidName) return 'Enter valid name';
                  },
                ),
                CustomFormField(
                  hintText: 'Phone',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isAgeValidation) return 'Enter valid Age';
                  },
                ),
                CustomFormField(
                  hintText: 'Name',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isDomainValidation) return 'Enter valid name';
                  },
                ),
                CustomFormField(
                  hintText: 'Phone',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  validator: (val) {
                    if (!val!.isPhoneNumber) return 'Enter valid phone';
                  },
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
                          if (_formKey.currentState!.validate()) {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => SuccessPage(),
                            //   ),
                            // );
                          }
                          // okButtonClicked();
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

void takePhotoFromSource(source) async {
  XFile? pickedfile = await ImagePicker().pickImage(source: source);
  imagefile = pickedfile;
}

okButtonClicked() async {
  final name = nameController.text.trim();
  final age = ageController.text.trim();
  final domain = domainController.text.trim();
  final number = phoneController.text.trim();
  final image = imagefile;
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
  }
}

extension ExtString on String {
  bool get isNameValidation {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isAgeValidation {
    final ageRegExp = RegExp(r"^\+?0[0-9]{1}$");
    return ageRegExp.hasMatch(this);
  }

  bool get isDomainValidation {
    final domainRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return domainRegExp.hasMatch(this);
  }

  bool get isPhoneValidation {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }
}
