import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';

Widget textFieldPhoneNumber(TextEditingController controller){
return   Container(decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),

  ),child: Padding(
    padding:const EdgeInsets.all(10)         ,
    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [

      //   SizedBox(width: 20,),

      Flexible(child:  TextFieldGlobal(label: white2,
        controller:controller ,hint: " +02 01150061654",widthBorder:2.0)),
      Icon(Icons.keyboard_arrow_down_sharp,color: black,),
      sizedBoxGlobalWidth10(),
      const CircleAvatar(radius: 10,backgroundImage:NetworkImage("https://firebasestorage.googleapis.com/v0/b/okhtub-5a9d2.appspot.com/o/flags%2F149.png?alt=media&token=4f1cd246-f980-4957-942c-abd6190e3496"))
    ],),
  ));
}