import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student/constant/color/colors.dart';
import 'package:student/constant/size/sized_box.dart';
import 'package:student/presentation/home/home_screen.dart';
import 'package:student/presentation/splash/widget/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _a = false;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 700),
      () {
        setState(
          () {
            _a = !_a;
          },
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          SlideTransitionAnimation(
            const HomeSceen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: Colors.white,
          ),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       const Center(
          //         child: Text(
          //           'Student\n   Managment',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             fontSize: 35,
          //             color: Colors.blue,
          //           ),
          //         ),
          //       ),
          //       Lottie.asset('asset/lottie/student.json')
          //     ],
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(
                child: Text(
                  'Student\n   Management ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: kblack,
                  ),
                ),
              ),
              Lottie.asset('asset/lottie/student.json'),
            ],
          )
        ],
      ),
    );
  }
}
