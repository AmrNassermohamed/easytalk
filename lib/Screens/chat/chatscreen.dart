import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, EdgeInsets,Key, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';
import 'package:translationchat/shared/widgets/circleavatatimage.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  ChatScreenState createState() => ChatScreenState ();
}

class ChatScreenState extends State<ChatScreen> {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  late final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: cyan,
          body:
                 Center(
                  child: Container(

                    height: MediaQuery.of(context).size.height,
                    color: cyan,
                    child: Column(children: [
                   sizedBoxGlobalHeight10(),
                       Padding(
                         padding: const EdgeInsets.only(left: 20,right: 20),
                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    GestureDetector(onTap: (){
                      Navigator.of(context).pop();
                    },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    Image.asset("assests/Group 1344.png"),
                      ],),
                       ),
                      sizedBoxGlobalHeight10(),

                      Expanded(child: Container(width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
  borderRadius:BorderRadius.only(
      topLeft:  const  Radius.circular(30.0),
      topRight: const  Radius.circular(30.0)),

  color: Colors.grey.shade100,
                          ),
child: Column(children: [
  sizedBoxGlobalHeight20(),
  textGlobalDarkCyanBold13(context: context,text: "ايه محمد"),
  textGlobalDarkCyanBold13(context: context,text: "كان نشطامنذ خمس دقائق"),
  Directionality(
   textDirection: TextDirection.rtl,
    child: Center(
      child: Container(
        width: 150,
        padding:const EdgeInsets.only(left: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: cyan,
        ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        sizedBoxGlobalWidth20(),const Icon(Icons.keyboard_arrow_down,color: Colors.white,),


          textGlobalWhiteNormal16(context: context,text: "اللغه"),
        sizedBoxGlobalWidth20(),
        const  Icon(Icons.map,color: Colors.white,),


      ],),),
    ),
  ),
  Expanded(child:  ListView.builder(
    shrinkWrap: true,
    padding: const EdgeInsets.all(10),
      itemCount: 15,
      itemBuilder: (BuildContext context,int index){
        return Directionality(
         textDirection: index%2==0?TextDirection.rtl:TextDirection.ltr,
          child: Row(children: [
           circleAvatarImage(),
            sizedBoxGlobalWidth10(),
            Container(        decoration: BoxDecoration(
              color: index%2==0?Colors.white: lightCyan,
              borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(15),topRight:Radius.circular(15) ),
            ),child:Padding(padding:const EdgeInsets.all(10.0),child:index%2==0? textGlobalDarkCyanBold13(context: context,text: "gggggf"):textGlobalWhiteBold14(context: context,text: "gggggggggggggg") ),)
          ],),
        );
      }
  ),),
  comButton(context),
],),)),

                    ],),
                  ))),
    );

  }



}
Widget comButton(BuildContext context){
  TextEditingController controller = TextEditingController(text: "");
return  Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10.0,top: 10.0),
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
        sizedBoxGlobalWidth10(),
        const Icon(Icons.image,color: Colors.white,),
sizedBoxGlobalWidth10(),
        Image.asset("assests/Icon ionic-ios-send.png",width: 20,),

      ],),
    ),),
  );

}