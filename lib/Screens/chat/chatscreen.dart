import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, EdgeInsets,Key, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/provider/chatprovider.dart';
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
  ScrollController ? _controller ;
  late final TextEditingController controller =TextEditingController();
  @override
  void initState() {
    super.initState();
_controller=ScrollController();
  }


  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ChatProvider>(context);
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

                      Expanded(child: Container(decoration:BoxDecoration(
  borderRadius:const BorderRadius.only(
      topLeft:  Radius.circular(30.0),
      topRight: Radius.circular(30.0)),

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
    StreamBuilder<DocumentSnapshot>(
    stream:validationService.getMessage(8182,7182),
    builder: (BuildContext context,
    AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (!snapshot.hasData) {
      return  const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.green,
          // #to_do handling the progess bar to be stop if there no connecction
          // or error happened
        ),

      );
    } //end
     else if (snapshot.hasError) {
        return new Text("");
        // #to_do handling the progess bar to be stop if there no connecction
        // or error happened
      }

else{
    if (snapshot.data != null) {

      validationService.printMessage(snapshot);

      return Expanded(child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          controller: _controller,
          padding: const EdgeInsets.all(10),
          itemCount: validationService.messageList.length,
          itemBuilder: (BuildContext context, int index) {
            return Directionality(
              textDirection: validationService.messageList[index].from==7182? TextDirection.rtl : TextDirection
                  .ltr,
              child: Row(children: [
                circleAvatarImage(),
                sizedBoxGlobalWidth10(),
                Expanded(
                  child: Container(decoration: BoxDecoration(
                    color: validationService.messageList[index].from==7182? Colors.white : lightCyan,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                    child: Padding(padding: const EdgeInsets.all(10.0),
                        child: validationService.messageList[index].from==7182
                            ?GestureDetector(onTap: () async {
                        String word    =await  validationService.translateWord(target: "en",message: validationService.messageList[index].message);
validationService.addMessage(addOrUpdate: false, text: word, type: 1, from: 7182, to: 8182, documentId: "", docField:validationService.messageList[index].documentId );
                        },child: textGlobalDarkCyanBold13(
                            context: context, text: validationService.messageList[index].message))
                            : textGlobalWhiteBold14(
                            context: context, text: validationService.messageList[index].message))),
                ),
              ],),
            );
          }
      ),);
    }else{
      return Text("");
    }

    }})
   ,
  comButton(context),
],),)),

                    ],),
                  ))),
    );

  }



}
Widget comButton(BuildContext context){
  final validationService = Provider.of<ChatProvider>(context);
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
        GestureDetector(onTap: (){




          validationService.addMessage(addOrUpdate: true,text: controller.text, type: 0,
              from: 7182, to: 8182, documentId: "dd", docField: "ff");
        },child: Image.asset("assests/Icon ionic-ios-send.png",width: 20,)),

      ],),
    ),),
  );

}