import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/color/colors.dart';
import '../home/home_screen.dart';
import 'widget/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
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
            HomeSceen(),
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Center(
                child: Text(
                  'BROTOTYPE',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: kblack,
                  ),
                ),
              ),
              Lottie.asset(
                'asset/lottie/student.json',
              ),
            ],
          )
        ],
      ),
    );
  }
}
