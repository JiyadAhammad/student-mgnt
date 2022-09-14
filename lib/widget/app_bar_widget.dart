import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/presentation/form_widget/form_widget.dart';
import 'package:student/presentation/home/widget/serach.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final IconData searchIcon;
  final IconData addIcon;
  const AppBarWidget({
    Key? key,
    required this.title,
    this.searchIcon = Icons.search,
    this.addIcon = Icons.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kblack,
      title: Text(
        title,
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
          icon: Icon(
            searchIcon,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.to(
              const Formwidget(),
              transition: Transition.zoom,
              duration: const Duration(
                milliseconds: 1000,
              ),
            );
          },
          icon: Icon(
            addIcon,
          ),
        ),
      ],
    );
  }
}
