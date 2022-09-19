import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/controller/controller/student_controller.dart';
import 'package:student/view/form_widget/form_widget.dart';
import 'package:student/view/home/widget/serach.dart';
import 'package:student/view/student_details/student_details.dart';

// ignore: must_be_immutable
class HomeSceen extends StatelessWidget {
  HomeSceen({Key? key}) : super(key: key);

  StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: kblack,
          title: const Text(
            'Home',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Search(),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.to(
                  () => Formwidget(),
                  transition: Transition.zoom,
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<StudentController>(
        init: StudentController(),
        builder: (stdobj) {
          // log('${studentControllerList.list.length} this is the lenth');
          return stdobj.list.isNotEmpty
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: stdobj.list.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemBuilder: (context, index) {
                    // log('${studentController.list[index].studentName!} this log from home screen');
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        right: 10.w,
                        left: 10.w,
                      ),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3.0, color: kwhite),
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
                              StudentDetail(
                                index: index,
                                // controllerObj: studentController,
                                // data: studentController.list[index],
                              ),
                            );
                          },
                          // onLongPress: () {
                          //   // showDialog(
                          //   //   context: context,
                          //   //   builder: (ctx) => const DeleteDialogWidget(),
                          //   // );
                          //   Get.defaultDialog();
                          // },
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              File(
                                stdobj.list[index].studentImage!,
                              ),
                            ),
                            radius: 30,
                          ),
                          title: Text(
                            stdobj.list[index].studentName!.toUpperCase(),
                            style: const TextStyle(color: kwhite),
                          ),
                          subtitle: Text(
                            stdobj.list[index].studentDomain!,
                            style: TextStyle(color: kgrey),
                          ),
                          trailing: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // if (stdobj.list[index].id == null) {
                              //   return;
                              // }
                              // stdobj.deleteStudent(
                              //   stdobj.list[index].id!,
                              //   index,
                              // );
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
                                onConfirm: () {
                                  stdobj.deleteStudent(
                                    stdobj.list[index].id!,
                                    index,
                                  );
                                  Get.offAll(HomeSceen());
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
                                        'Successfully Deleted',
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
                                },
                                buttonColor: kwhite,
                                textCancel: 'Cancel',
                                cancelTextColor: kwhite,
                                onCancel: () {
                                  Get.offAll(HomeSceen());
                                },
                                barrierDismissible: false,
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: kred,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : ListView(
                  children: [
                    Center(
                      child: Lottie.asset(
                        'asset/lottie/emptyfile.json',
                      ),
                    ),
                    const Center(
                      child: Text(
                        "No Data Found!! 😟",
                        style: TextStyle(
                          color: kwhite,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
