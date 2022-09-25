import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../constant/color/colors.dart';
import '../../../controller/controller/student_controller.dart';
import '../../../model/data_model/data_model.dart';
import '../../student_details/student_details.dart';

final StudentController studcontroller = Get.put(StudentController());

class Search extends SearchDelegate<dynamic> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Student> searched = studcontroller.list
        .where(
          (Student element) => element.studentName!.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      backgroundColor: kwhite,
      body: searched.isEmpty
          ? ListView(
              children: <Widget>[
                Center(
                  child: Lottie.asset(
                    'asset/lottie/emptyfile.json',
                  ),
                ),
                const Center(
                  child: Text(
                    'No Data Found!! 😟',
                    style: TextStyle(
                      color: kblack,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: FileImage(
                          File(
                            searched[index].studentImage!,
                          ),
                        ),
                        child: Container(
                          height: 200,
                        ),
                      ),
                      onTap: () async {
                        Get.to(
                          StudentDetail(
                            index: index,
                            dataList: searched[index],
                          ),
                        );
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          bottom: 3,
                          top: 3,
                        ),
                        child: Text(
                          searched[index].studentName!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return const Divider(
                    height: 20,
                    thickness: 3,
                  );
                },
                itemCount: searched.length,
              ),
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Student> searched = studcontroller.list
        .where(
          (Student element) => element.studentName!.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      backgroundColor: kwhite,
      body: searched.isEmpty
          ? ListView(
              children: <Widget>[
                Center(
                  child: Lottie.asset(
                    'asset/lottie/emptyfile.json',
                  ),
                ),
                const Center(
                  child: Text(
                    'No Data Found!! 😟',
                    style: TextStyle(
                      color: kblack,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: FileImage(
                          File(
                            searched[index].studentImage!,
                          ),
                        ),
                        child: Container(
                          height: 200,
                        ),
                      ),
                      onTap: () async {
                        Get.to(
                          StudentDetail(
                            index: index,
                            dataList: searched[index],
                          ),
                        );
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          bottom: 3,
                          top: 3,
                        ),
                        child: Text(
                          searched[index].studentName!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return const Divider(
                    height: 20,
                    thickness: 3,
                  );
                },
                itemCount: searched.length,
              ),
            ),
    );
  }
}
