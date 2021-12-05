import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, Container, EdgeInsets,Image, Key, MainAxisAlignment,  Row, SingleChildScrollView, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/images.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'package:translationchat/shared/components/buttonglobal.dart';
import 'package:translationchat/shared/components/displaysnackbar.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';



class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);
  @override
  ContactUsState createState() => ContactUsState ();
}

class ContactUsState extends State<ContactUs> {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  late final TextEditingController nameController =TextEditingController();
  late final TextEditingController emailController =TextEditingController();
  late final TextEditingController messageController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<UserProvider>(context);
    return  SafeArea(
      child: Scaffold(
          body:SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child:   SizedBox(
              height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Column(children: [
                      sizedBoxGlobalHeight20(),
                     Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      textGlobalBlack20(context: context,text: "اتصل بنا")
                    ],)  ,
                      sizedBoxGlobalHeight20(),

                     Image.asset(contactUs,height: 150,)
                 ,

                      Container(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Column(children: [
                          sizedBoxGlobalHeight40(),
                        //Expanded(child:  Container()),
                         textGlobalBlackBold13(context: context,text: "اترك رسالتك وسوف نتواصل معاك"),
                         textGlobalBlackBold13
                           (context: context,text: "في اقرب وقت ممكن"),

                          TextFieldGlobal(controller:nameController ,hint: "الاسم باللغه العربيه كاملا",label: darkCyan,widthBorder: 2.0,),
                          TextFieldGlobal(controller:emailController ,hint: "البريد الالكتروني",label: darkCyan,widthBorder: 2.0,),

                        TextFieldGlobal(controller:messageController ,
                            hint:"ماذا تريد ان تخبرنا", label: darkCyan,widthBorder: 2.0,),
                        //  Expanded(child: Container()),
                          sizedBoxGlobalHeight40(),
                          GestureDetector(onTap: () async {

                            var response  = await validationService.contactUS(name: nameController.text,
                                email: emailController.text, message: messageController.text);
                            if(response==0){
                              displaySnackBar(context, "تم التسجيل");


                            }else if(response==1){
                              displaySnackBar(context, " يرجي مراجعه الايميل ورقم التليفون");
                            }
                          },child: buttonGlobal(context: context,text: "ارسل"))
                        ],),


                      ),














                      //GlobalTextField(controller: controller, hint: hint)

                    ],)),
              ))),
    );

  }



}