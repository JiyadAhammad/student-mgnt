import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/controller/controller/student_controller.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          ListTile(
            onTap: () async {
              Get.find<StudentController>().getCamera();
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
              Get.find<StudentController>().getGallery();
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
        ],
      ),
    );
  }
}