import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/images.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';

Widget componentSend({required BuildContext context,icon,image,text,backgroundColor,color}){
 return GestureDetector(
   onTap: (){

   },
   child: Container(decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: backgroundColor
    ),child: Padding(
      padding:const EdgeInsets.all(10)         ,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        Image.asset(image),
        //   SizedBox(width: 20,),
        sizedBoxGlobalWidth20(),
      Expanded(child:   textGlobalWhiteBold14(context: context,text: text)),
        sizedBoxGlobalWidth20(),
        Icon(icon,color: white2,),
      ],),
    )),
 );


}Widget componentSend2({required BuildContext context,icon,image,text,backgroundColor,color}){
  return GestureDetector(
    onTap: (){

    },
    child: Container(decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20))

    ),child: Padding(
      padding:const EdgeInsets.all(10)         ,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        Image.asset(image),
        //   SizedBox(width: 20,),
        sizedBoxGlobalWidth20(),
        textGlobalBlackBold13(context: context,text: text),
        sizedBoxGlobalWidth20(),
      const Icon(Icons.phone_android_sharp)
        //  Image.asset(phoneIcon,width: 50,height: 50,),
      ],),
    )),
  );


}



Widget emailSend(BuildContext context){
  return componentSend(context: context,text: "ارسال رساله عبر البريد الالكتروني",
      image: emailIcon,backgroundColor: darkCyan,icon: Icons.email);
}
Widget phoneSend(BuildContext context){
  return componentSend2(context: context,icon: Icons.phone,image:emailIcon,
    backgroundColor: white,text: "ارسال رساله عبر الهاتف المحمول" );
}




