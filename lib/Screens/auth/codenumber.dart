import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, Container, Key, MainAxisAlignment, Row, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:translationchat/Screens/auth/sucesscode.dart';
import 'package:translationchat/shared/components/buttonglobal.dart';
import 'package:translationchat/shared/components/navigator.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';
import 'components/pincodenumber.dart';

class CodeNumber extends StatefulWidget {
  const CodeNumber({Key? key}) : super(key: key);


  @override
  CodeNumberState  createState() => CodeNumberState ();
}

class CodeNumberState extends State<CodeNumber> {


  TextEditingController controller = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
          body:

              Container(
                color: Colors.white70,
                child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [





                       Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      const   Icon(Icons.arrow_back),
                           textGlobalBlackBold16(context: context,text: "برجاء ادخال رمز التحقق")
                         ],),

                      codeNumber(context: context,controller: controller),
                      textGlobalBlackBold16(context: context,text: "اعاده ارسال الرمز"),
                       sizedBoxGlobalHeight40(),
                      sizedBoxGlobalHeight40(),
                    GestureDetector(onTap: (){
                      AppNavigator.navigateTo(context,const SucCode());

                    },child: buttonGlobalText(context: context,text: "ارسل"))


                    ],)),
              )),
    );

  }
}