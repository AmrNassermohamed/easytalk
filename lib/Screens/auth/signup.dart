import 'package:flutter/cupertino.dart' show BorderRadius, BoxDecoration, BoxFit, BuildContext, Center, Column, Container, DecorationImage, EdgeInsets, ExactAssetImage, Expanded, Key, MainAxisAlignment, MediaQuery, Radius, Row, SingleChildScrollView, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:translationchat/Screens/auth/components/textfieldphonenumber.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/images.dart';
import 'package:translationchat/shared/components/navigator.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';

import 'codenumber.dart';
import 'components/buttonsendemail.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  SignUpState createState() => SignUpState ();
}

class SignUpState extends State<SignUp> {
 // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  late final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(0),
    child:   Center(
    child: Column(children: [
      Container(

        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
        color: lightCyan,
          image: const DecorationImage(image: ExactAssetImage(map2), fit: BoxFit.cover,),
        ),child: Column(children: [
          Expanded(child: Container()),
          textGlobalWhiteBold18(context: context,text: "مرحبا بك"),
        textGlobalWhiteBold14(context: context,text: "يرجي تسجيل الدخول لاستفاده من التطبيق "),
        Expanded(child: Container()),
      ],),
      ),
 Container(
   padding: const EdgeInsets.only(left: 30,right: 30),
   child: Column(children: [
     TextFieldGlobal(controller:controller ,hint: "الاسم باللغه العربيه كاملا",label: darkCyan,widthBorder: 2.0,),
     TextFieldGlobal(controller:controller ,hint: "البريد الالكتروني",label: darkCyan,widthBorder: 2.0,),
     textFieldPhoneNumber(controller),
     sizedBoxGlobalHeight10(),
     emailSend(context),
     sizedBoxGlobalHeight10(),
     phoneSend(context),
     Divider(color: darkCyan,thickness: 5,),
   ],),


 ),











      GestureDetector(
        onTap: (){
          AppNavigator.navigateTo(context,const CodeNumber());
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: darkCyan
          ),child: Padding(
            padding:const  EdgeInsets.all(10)         ,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [

              textGlobalWhiteBold14(context: context,text: "تسجيل"),

            ],),
          )),
        ),
      ),textGlobalGreyBold13(context: context,text: "تمتلك حساب بالفعل سجل .... الدخول  ")

      //GlobalTextField(controller: controller, hint: hint)

        ],))));

  }



}