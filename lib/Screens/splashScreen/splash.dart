import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translationchat/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2,
      body: Center(child: Column(children: [
        Image.asset("assests/Group988.png",),
        Image.asset("assests/Group1.png"),
      ],)
      ),
    );
  }
}
class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}