import 'package:flutter/cupertino.dart';

class SlideTransitionAnimation extends PageRouteBuilder<dynamic> {
  SlideTransitionAnimation(this.page)
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> anotherAnimation) =>
              page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> anotherAnimation,
              Widget child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              textDirection: TextDirection.rtl,
              child: page,
            );
          },
        );
  final Widget page;
}
