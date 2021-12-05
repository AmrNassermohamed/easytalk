import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
Widget circleAvatarImage(imageUrl,bool? big){
  if(imageUrl==null) {
    return  CircleAvatar(
      backgroundColor: Colors.black,
      radius:big==false? 25.0:50.0,
      child: CircleAvatar(
        backgroundImage: const AssetImage('assests/Group 1095.png'),
        radius:big==false? 23.0:45.0,
      ),
    );
  }else{
    return   CircleAvatar(
      backgroundColor: Colors.black,
      radius:big==false? 25.0:50.0,
      child: CircleAvatar(

          backgroundImage: NetworkImage("https://56a5-156-213-149-48.ngrok.io/storage/profile_images/0A9ukszakiixHnFr0cFUGyUIjIUXbPbNFV9HI64n.jpg"),
        radius: big==false? 23.0:45.0,
      ),
    );
  }
}