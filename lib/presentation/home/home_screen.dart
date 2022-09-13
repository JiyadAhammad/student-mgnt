import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/presentation/form_widget/form_widget.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kblack,
        title: const Text(
          'Home',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const Formwidget(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return kheight5;
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 3.0,color: kblack),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                ),
                title: Text(
                  'Name ${index + 1} ',
                ),
                subtitle: Text(
                  'SubTitle ${index + 1} ',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
