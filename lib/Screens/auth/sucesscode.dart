import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, Container, Key, MainAxisAlignment, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/images.dart';
import 'package:translationchat/shared/components/buttonglobal.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';


class SucCode extends StatefulWidget {
  const SucCode({Key? key}) : super(key: key);


  @override
  SucCodeState  createState() => SucCodeState ();
}

class SucCodeState extends State<SucCode> {


  TextEditingController controller = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
          body:

          Container(
            color: Colors.black12,
            child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                 Padding(
padding: const EdgeInsets.all(20),
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color: white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),child: Column(children: [
                    sizedBoxGlobalHeight30(),
                     Image.asset(iconActive),
                     textGlobalBlackBold16(context: context,text: "تم التحقق الرمز بالنجاح"),
                     sizedBoxGlobalHeight30(),
                     textGlobalBlackBold13(context: context,text: "تم التاكيد علي حساب الجديد بالتطبيق"),
                     textGlobalBlackBold16(context: context,text: " شكرا .."),
                     sizedBoxGlobalHeight30(),
                     buttonGlobalText(context: context,text: "موافق"),
                     sizedBoxGlobalHeight30(),


                   ],),),
                 ),


              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: darkCyan,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),child: Padding(
                  padding:const EdgeInsets.only(left: 10,right: 10),
          child: Row(children: [
            Image.asset("assests/Iconfeather-smile.png",width: 20,),
                    Expanded(child: TextFieldGlobal(controller: controller, label: darkCyan, hint: '',widthBorder: 0.0,)),
                    const Icon(Icons.image,color: Colors.white,),
                    const Icon(Icons.arrow_forward_ios_outlined,color:Colors.white,),

                  ],),
        ),),
              ),

  Row(children: [
    ClipOval(
        child: Image.asset(
          'assests/Iconfeather-smile.png',
          fit: BoxFit.contain,
          matchTextDirection: true,
          height: 50,
        )),
    sizedBoxGlobalWidth10(),
    Container(        decoration: BoxDecoration(
      color: darkCyan,
      borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(15),topRight:Radius.circular(15) ),
    ),child:Padding(padding:const EdgeInsets.all(10.0),child: textGlobalWhiteBold14(context: context,text: "gggggggggggggg") ),)
],),
                ],)),
          )),
    );

  }
}