import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';

class StudentDetail extends StatelessWidget {
  const StudentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: kblack,
          leading: IconButton(
            onPressed: () {
              Get.back();
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
              onPressed: () {},
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
      body: Padding(
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
                radius: 100.r,
              ),
            ),
            kheight20,
            const Detailswidget(studentDetails: 'name'),
            kheight,
            const DividerWidget(),
            kheight20,
            const Detailswidget(studentDetails: 'age'),
            kheight,
            const DividerWidget(),
            kheight20,
            const Detailswidget(studentDetails: 'domain'),
            kheight,
            const DividerWidget(),
            kheight20,
            const Detailswidget(studentDetails: 'number'),
            kheight,
            const DividerWidget(),
            kheight20,
          ],
        ),
      ),
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
