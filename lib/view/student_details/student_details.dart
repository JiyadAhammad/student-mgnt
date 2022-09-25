import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/color/colors.dart';
import '../../constant/size/sized_box.dart';
import '../../controller/controller/student_controller.dart';
import '../../model/data_model/data_model.dart';
import '../home/home_screen.dart';

class StudentDetail extends StatelessWidget {
  const StudentDetail({
    super.key,
    required this.index,
    required this.dataList,
  });
  final int index;
  final Student dataList;

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
          centerTitle: true,
        ),
      ),
      body: GetBuilder<StudentController>(
        init: StudentController(),
        builder: (StudentController data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: FileImage(File(dataList.studentImage!)),
                      radius: 100.r,
                    ),
                  ),
                  kheight20,
                  Detailswidget(
                      studentDetails:
                          'Name${'       = ${dataList.studentName}'.toUpperCase()}'),
                  kheight,
                  const DividerWidget(),
                  kheight20,
                  Detailswidget(
                      studentDetails: 'Age          = ${dataList.studentAge}'),
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
                      studentDetails: 'Number   = ${dataList.studentPHNumber}'),
                  kheight,
                  const DividerWidget(),
                  kheight20,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Detailswidget extends StatelessWidget {
  const Detailswidget({
    super.key,
    required this.studentDetails,
  });
  final String studentDetails;

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
  const DividerWidget({super.key});

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
