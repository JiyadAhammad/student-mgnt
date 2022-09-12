import 'package:flutter/material.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            kheight20,
            TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.send,
                ),
                hintText: 'Hint Text',
                border: OutlineInputBorder(),
              ),
            ),
            kheight20,
            TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.send,
                ),
                hintText: 'Hint Text',
                border: OutlineInputBorder(),
              ),
            ),
            kheight20,
            TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.send,
                ),
                hintText: 'Hint Text',
                border: OutlineInputBorder(),
              ),
            ),
            kheight20,
            TextField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.send,
                ),
                hintText: 'Hint Text',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
