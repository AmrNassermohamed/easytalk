import 'package:flutter/material.dart';

Widget circleAvatarImage(){
  return const CircleAvatar(
    backgroundColor: Colors.black,
    radius: 25.0,
    child: CircleAvatar(
      backgroundImage: AssetImage('assests/Group 1095.png'),
      radius: 23.0,
    ),
  );
}