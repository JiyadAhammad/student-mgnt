import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/controller/controller/student_controller.dart';
import 'package:student/view/home/home_screen.dart';
import 'package:student/view/update/update_screen.dart';

// ignore: must_be_immutable
class StudentDetail extends StatelessWidget {
  final int index;
  final dataList;
  const StudentDetail({
    Key? key,
    required this.index,
    this.dataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data = controllerObj.list[index];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: kblack,
          leading: IconButton(
            onPressed: () {
              Get.offAll(() => HomeSceen());
            },
            icon: const Icon(
              Icons.arrow_drop_down,
              color: kwhite,
              size: 40,
            ),
          ),
          title: const Text(
            'Student Details',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(UpdateScreen(
                  index: index,
                ));
              },
              icon: const Icon(
                Icons.edit,
                color: kwhite,
                size: 30,
              ),
            ),
          ],
          centerTitle: true,
        ),
      ),
      body: GetBuilder<StudentController>(
          init: StudentController(),
          builder: (data) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage:
                            FileImage(File(data.list[index].studentImage!)),
                        radius: 100.r,
                      ),
                    ),
                    kheight20,
                    Detailswidget(
                        studentDetails:
                            'Name${'       = ${data.list[index].studentName}'.toUpperCase()}'),
                    kheight,
                    const DividerWidget(),
                    kheight20,
                    Detailswidget(
                        studentDetails:
                            'Age          = ${data.list[index].studentAge}'),
                    kheight,
                    const DividerWidget(),
                    kheight20,
                    Detailswidget(
                        studentDetails:
                            'Domain   = ${data.list[index].studentDomain}'),
                    kheight,
                    const DividerWidget(),
                    kheight20,
                    Detailswidget(
                        studentDetails:
                            'Number   = ${data.list[index].studentPHNumber}'),
                    kheight,
                    const DividerWidget(),
                    kheight20,
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class Detailswidget extends StatelessWidget {
  final String studentDetails;
  const Detailswidget({
    Key? key,
    required this.studentDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(
        studentDetails,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: kblack,
          fontSize: 30,
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Divider(
        height: 5,
        thickness: 2,
        color: kblack,
      ),
    );
  }
}
