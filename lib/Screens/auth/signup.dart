import 'package:flutter/cupertino.dart' show BorderRadius, BoxDecoration, BoxFit, BuildContext, Center, Column, Container, DecorationImage, EdgeInsets, ExactAssetImage, Expanded, Key, MainAxisAlignment, MediaQuery, Radius, Row, SingleChildScrollView, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/Screens/auth/components/textfieldphonenumber.dart';
import 'package:translationchat/Screens/auth/login.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/images.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'package:translationchat/shared/components/back.dart';
import 'package:translationchat/shared/components/displaysnackBar.dart';
import 'package:translationchat/shared/components/navigator.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';

import 'package:translationchat/shared/text_global.dart';
import 'codenumber.dart';
import 'components/buttonsendemail.dart';

class SignUp extends StatefulWidget {

  const SignUp({Key? key}) : super(key: key);
  @override
  SignUpState createState() => SignUpState ();
}

class SignUpState extends State<SignUp> {
 // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);
  final focusNode = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  late final TextEditingController nameController =TextEditingController();
  late final TextEditingController emailController =TextEditingController();
  late final TextEditingController mobileNumberController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<UserProvider>(context);
    return   WillPopScope(
        onWillPop: () async {
          focusNode3.unfocus();
          focusNode.unfocus();
          focusNode2.unfocus();
         return true;
        },
      child: Scaffold(
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
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [
              Back()
            ],),
          ),
            Expanded(child: Container()),
            textGlobalWhiteBold18(context: context,text: "?????????? ????"),
          textGlobalWhiteBold14(context: context,text: "?????????? ???????? ???????? "),
          Expanded(child: Container()),
        ],),
        ),
 Container(
   padding: const EdgeInsets.only(left: 30,right: 30),
   child: Column(children: [


       TextFieldGlobal(myFocusNode: focusNode,keyboardType: TextInputType.text,controller:nameController ,hint: "?????????? ???????????? ?????????????? ??????????",label: darkCyan,widthBorder: 2.0,),
       TextFieldGlobal(myFocusNode: focusNode2,keyboardType: TextInputType.text,controller:emailController ,hint: "???????????? ????????????????????",label: darkCyan,widthBorder: 2.0,),
       textFieldPhoneNumber(mobileNumberController,context),
      // sizedBoxGlobalHeight10(),
      // emailSend(context,(){}),
       sizedBoxGlobalHeight10(),
       phoneSend(context,() async {
         validationService.mobileNumber=mobileNumberController.text;
       var response  =await validationService.signUp(name: nameController.text, email: emailController.text, mobileNumber: mobileNumberController.text);
       if(response==0){
         displaySnackBar(context, "???? ??????????????");

         validationService.sendMobileNumber(mobileNumber:
         mobileNumberController.text.trim());
         AppNavigator.navigateOfAll(context, CodeNumber(route: 0,));
       }else{
         switch(response){
           case 4:
             displaySnackBar(context, "?????? ?????????????? ???????? ???? ??????");
        break;
           case 5:
             displaySnackBar(context, "???????? ???????????? ??????????????");
             break;
           case 7:
             displaySnackBar(context, "???????? ???????????? ?????? ????????????????");
             break;
           case 6:
             displaySnackBar(context, "?????? ???????????????? ???????? ???? ??????");
             break;

         }

       }
       }),
       Divider(color: darkCyan,thickness: 5,),
   ],),


 ),











       /* GestureDetector(
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

                textGlobalWhiteBold14(context: context,text: "??????????"),

              ],),
            )),
          ),
        ),textGlobalGreyBold13(context: context,text: "?????????? ???????? ???????????? ?????? .... ????????????  ")*/

        //GlobalTextField(controller: controller, hint: hint)

          ],)))),
    );

  }



}