import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, Container, EdgeInsets,Image, Key, MainAxisAlignment,  Row, SingleChildScrollView, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';



class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  SettingsState createState() => SettingsState ();
}

class SettingsState extends State<Settings> {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  late final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body:SingleChildScrollView(


                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(

                      child: Column(children: [
                        sizedBoxGlobalHeight20(),
                        Padding(
                         padding: const EdgeInsets.all(20),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                           sizedBoxGlobalWidth20(), textGlobalBlack20(context: context,text: "الاعدادت")
                          ],),
                        )  ,
                        sizedBoxGlobalHeight20(),

                        Image.asset("assests/Group 911.png",height: 150,)
                        ,
                        content(context: context,text: "الخصوصيه",iconData: Icons.lock),
                        content(context: context,text: "الامان",iconData: Icons.label),
                        content(context: context,text: "تغيير رقم هاتف المحمول",iconData: Icons.exit_to_app),
                        content(context: context,text: "حذف حسابي",iconData: Icons.delete),
                        content(context: context,text: "طلب معلومات الحساب",iconData: Icons.note),
                        content(context: context,text: "عن التطبيق",iconData: Icons.phone_android_sharp),
                        content(context: context,text: "من نحن",iconData: Icons.error_outline),













                        //GlobalTextField(controller: controller, hint: hint)

                      ],)),
                ),
              )),
    );

  }



}

Widget content({required BuildContext context,text,iconData}){
return  Padding(padding: const EdgeInsets.only(left: 30,right: 30,top: 15,bottom: 15),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    Icon(iconData),
    textGlobalBlackBold13(context: context,text:text)

  ],),);
}