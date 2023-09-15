import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleAnimationI extends StatelessWidget {
  const SimpleAnimationI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('rakesh')),
      body: Center(
        child: RiveAnimation.asset(
          "assets/iconsd.riv",
        ),
      ),
    );
  }
}