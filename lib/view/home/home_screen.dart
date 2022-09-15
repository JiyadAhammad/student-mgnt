import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/view/student_details/student_details.dart';
import 'package:student/widget/app_bar_widget.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: 'Home'),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox();
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              right: 10.w,
              left: 10.w,
            ),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: kblack),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Get.to(
                    transition: Transition.downToUp,
                    duration: const Duration(
                      milliseconds: 800,
                    ),
                    const StudentDetail(),
                  );
                },
                // onLongPress: () {
                //   // showDialog(
                //   //   context: context,
                //   //   builder: (ctx) => const DeleteDialogWidget(),
                //   // );
                //   Get.defaultDialog();
                // },
                leading: const CircleAvatar(
                  radius: 30,
                ),
                title: Text(
                  'Name ${index + 1} ',
                ),
                subtitle: Text(
                  'SubTitle ${index + 1} ',
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Alert!!',
                          titleStyle: const TextStyle(
                            fontSize: 25,
                            color: kwhite,
                          ),
                          middleText: 'Do you want to Delete ',
                          middleTextStyle: const TextStyle(
                            fontSize: 20,
                            color: kwhite,
                          ),
                          backgroundColor: kblack,
                          textConfirm: 'Ok',
                          confirmTextColor: kblack,
                          onConfirm: () {},
                          buttonColor: kwhite,
                          textCancel: 'Cancel',
                          cancelTextColor: kwhite,
                          onCancel: () {
                            Get.back();
                          },
                          barrierDismissible: false,
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
