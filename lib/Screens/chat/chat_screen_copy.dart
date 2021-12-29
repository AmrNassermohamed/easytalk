import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart' show BuildContext, Center, Column, CupertinoSwitch, EdgeInsets, Key,  TextEditingController, Widget;
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:translationchat/Screens/room/roomscreen.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/strring.dart';
import 'package:translationchat/models/roommodel.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/shared/components/bottomsheetglobal.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';


import 'package:translationchat/shared/text_global.dart';
import 'package:translationchat/shared/widgets/circleavatatimage.dart';

final TextEditingController controller = TextEditingController();

class ChatScreen extends StatelessWidget {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  RoomModel? roomModel;
  int user1;
  bool roomBool;

  ChatScreen(
      {Key? key, this.roomModel, required this.user1, required this.roomBool});

  ScrollController ? _controller;
  String? x;


  //bool emojiShowing = false;
//  bool isKeyboardVisible = false;


  on(BuildContext context) {
    final validationService = Provider.of<ChatProvider>(context, listen: false);
    validationService.getChats();
    Navigator.of(context).pop();
  }
  _onBackspacePressed(BuildContext context) async {



  }
  Future toggleEmojiKeyboard(BuildContext context) async {
    final validationService = Provider.of<ChatProvider>(context, listen: false);
    if (validationService.isKeyboardVisible) {
      FocusScope.of(context).unfocus();
    }

    validationService.emojShowingBoolean();
  }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ChatProvider>(context, listen: false);


    return WillPopScope(
      onWillPop: () async {
        if (validationService.emojiShowing == false) {
          print("..............................................");
          print(validationService.emojiShowing);
          validationService.emojShowingBoolean();
          return true;
        } else {
          //print(validationService.emojiShowing);
          var data = await
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RoomScreen(),), (route) => false);
      return data;
        }
        // return  validationService.getChats();


      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: cyan,
            body:
            Center(
                child: Container(

                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  color: cyan,
                  child: Column(children: [
                    sizedBoxGlobalHeight10(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(onTap: () {
                            Navigator.of(context).pop();
                          }, child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white,)),
                          CupertinoSwitch(
                            trackColor: Colors.white,
                            activeColor: yellow,
                            value: validationService.settingLang,
                            onChanged: (value) {
                              validationService.changeLang();
                            },
                          ),


                          /*GestureDetector(onTap:(){
                   setState(() {

                     if(validationService.settingLang==true){
                       validationService.settingLang=false;
                     }else{
                       validationService.settingLang=true;
                     }
                   });
                 } ,
                     child:
                     validationService.settingLang==true?
                     Image.asset("assests/Group 1344.png"):
                     Image.asset("assests/Group 1345.png"))*/
                        ],),
                    ),
                    sizedBoxGlobalHeight10(),

                    Expanded(child: Container(decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),

                      color: Colors.grey.shade100,
                    ),
                      child: Column(children: [
                        sizedBoxGlobalHeight20(),
                        textGlobalDarkCyanBold13(context: context,
                            text: roomModel!.name),
                        // textGlobalDarkCyanBold13(context: context,text: "كان نشطامنذ خمس دقائق"),
                        validationService.settingLang == true ? GestureDetector(
                          onTap: () {
                            bottomSheetGlobal(context: context,
                                user1: user1,
                                chatId: roomModel!.fireBaseChatId);
                          }
                          , child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Center(
                            child: Container(
                              width: 200,

                              padding: const EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: cyan,
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, children: [
                                sizedBoxGlobalWidth20(),
                                const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white,),

                                StreamBuilder<DocumentSnapshot>(
                                    stream: validationService.getLang(
                                        roomModel!.fireBaseChatId),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                            DocumentSnapshot> snapshot) {
                                      //validationService.getLangList(snapshot, user1);
                                      return textGlobalWhiteNormal16(
                                          context: context,
                                          text: validationService.user.lang
                                              .toString());
                                    }),

                                /*Consumer<ChatProvider>(
    builder: (context, provider, child) {


    return                            textGlobalWhiteNormal16(
                                    context: context, text: provider.chosenLangIndex.lang);
    })*/
                                sizedBoxGlobalWidth20(),
                                const Icon(Icons.map, color: Colors.white,),


                              ],),),
                          ),
                        ),
                        ) : const SizedBox(height: 20),

                        StreamBuilder<DocumentSnapshot>(
                            stream: validationService.getMessage(
                                roomModel!.fireBaseChatId),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
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

                              else {
                                if (snapshot.data != null) {
                                  validationService.printMessage(snapshot);

                                  return Expanded(child: ListView.builder(
                                      shrinkWrap: true,
                                      reverse: true,
                                      controller: _controller,
                                      padding: const EdgeInsets.all(10),
                                      itemCount: validationService.messageList
                                          .length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Directionality(
                                            textDirection: validationService
                                                .messageList[index].from
                                                == user1
                                                ? TextDirection.rtl
                                                : TextDirection
                                                .ltr,
                                            child: Row(children: [
                                              circleAvatarImage(null, false),
                                              sizedBoxGlobalWidth10(),
                                              Expanded(
                                                  child:
                                                  Column(children: [

                                                    Row(children: [
                                                      Expanded(child: Message(index: index,checkMessage: true,user1: user1,))
                                                    ],),
                                                    /*                                  validationService.settingLang==true?GestureDetector(onTap: () async {


  //translateWord(index,context);

  String word = await validationService
      .translateWord(
      target: validationService
          .chosenLangIndex.code,
      message: validationService
          .messageList[index]
          .message);

  validationService
      .addMessage(
    translate: word,
      addOrUpdate: false,
      text: word,
      type: 2,
      from: 7182,
      to: 8182,
      documentId: widget
          .roomModel!
          .fireBaseChatId,
      docField: validationService
          .messageList[index]
          .documentId);
   },child:  CircleAvatar(
  radius: 15,
  backgroundColor: Colors.black,
  child: CircleAvatar(
    backgroundColor: Colors.white,
    radius: 13,
 child: Padding(padding: EdgeInsets.all(10),child: Image.asset("assests/Iconmaterial-translate.png",width: 40,height: 20,),),
  ),
)):SizedBox(),*/
                                                    /*validationService.settingLang==true?          Row(children:
                                        [Expanded(child:  message(index,false))],):SizedBox(height: 0,),*/
                                                    textGlobalBlackBold16(text:
                                                    formatDate(validationService
                                                        .messageList[index]
                                                        .creationDt, [
                                                      dd,
                                                      '/',
                                                      mm,
                                                      '/',
                                                      yyyy,
                                                      ' ',
                                                      HH,
                                                      ':',
                                                      nn
                                                    ]), context: context),
                                                  ],)

                                              ),
                                            ],),
                                          ),
                                        );
                                      }
                                  ),);
                                } else {
                                  return Text("");
                                }
                              }
                            }),

                        ActionButton(roomBool: roomBool,
                          roomModel: roomModel,
                          user1: user1,),
                        /*  Consumer<ChatProvider>(
                            builder: (context, provider, child) {
                              if (provider.isKeyboardVisible == true) {
                                return const Expanded(
                                    child: SizedBox(height: 1000,));
                              } else {
                                return const SizedBox(height: 10,);
                              }
                            }),*/
                        EmojyPicker(),


                      ],),)),

                  ],),
                ))),
      ),
    );
  }




  messagfe(index, bool checkMessage, BuildContext context) {


  }
}


class Message extends StatelessWidget {

  int index;
  bool checkMessage;
  int user1;
  Message({ required this.index, required this.checkMessage,required this.user1});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ChatProvider>(context, listen: false);

    return Container(
    decoration: BoxDecoration(
    color: validationService
        .messageList[index].from
    ==
    user1
    ? Colors.white
        : lightCyan,
    borderRadius: const BorderRadius
        .only(
    bottomLeft: Radius
        .circular(15),
    topRight: Radius
        .circular(15)),
    ),
    child:


    Padding(
    padding: const EdgeInsets
        .all(10.0),
    child: validationService.
    messageList[index].from
    ==
    user1

    ?
    textGlobalDarkCyanBold13(
  context: context,


  text: checkMessage == true ? validationService
      .messageList[index]
      .message : validationService.messageList[index]
      .translateMessage)
      : textGlobalWhiteBold14(
  context: context,
  text: checkMessage == true ? validationService
      .messageList[index]
      .translateMessage : validationService.messageList[index]
      .translateMessage)));
  }
  }






_onEmojiSelected(String emoji,BuildContext context) {

  controller.text = controller.text + emoji;
  //  validationService.emojShowingBoolean();
}




class EmojyPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ChatProvider>(context,listen: false);
    return  Consumer<ChatProvider>(
        builder: (context, provider, child)
        {
          return Offstage(
            offstage: validationService.emojiShowing,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                  onEmojiSelected: (Category category, Emoji emoji) {
                    _onEmojiSelected(emoji.emoji,context);
                  },
                  onBackspacePressed: (){
                    validationService.emojShowingBoolean();
                  },
                  config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      progressIndicatorColor: Colors.blue,
                      backspaceColor: Colors.blue,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecentsText: 'No Recents',
                      noRecentsStyle: const TextStyle(
                          fontSize: 20, color: Colors.black26),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          );
        });
  }
  }




class ActionButton extends StatelessWidget {

  RoomModel? roomModel;
  int user1;
  bool roomBool;
  ActionButton({Key? key,this.roomModel,required this.user1,required this.roomBool});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ChatProvider>(context,listen: false);


    return  Consumer<ChatProvider>(
        builder: (context, provider, child)
        {
          return Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, bottom: 10.0, top: 10.0),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: darkCyan,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ), child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(children: [
                IconButton(onPressed: () {
                  validationService.emojShowingBoolean();
                }, icon: Image.asset("assests/Iconfeather-smile.png", width: 20,)),


                Expanded(child: TextFieldGlobal(controller: controller,
                  label: darkCyan,
                  hint: '',
                  widthBorder: 0.0,)),
                sizedBoxGlobalWidth10(),
                const Icon(Icons.image, color: Colors.white,),
                sizedBoxGlobalWidth10(),
                IconButton(onPressed: () async {
                  appl.message = controller.text;

                  controller.text = "";
                  validationService.listen();
                  print(validationService.messageList.length);
                  if (validationService.messageList.isNotEmpty) {
                    if (roomBool == true) {
                      appl.chatId = roomModel!.chatId;
                    }
                    String word = await validationService
                        .translateWord(
                        target: validationService
                            .anotherUser.code,
                        message: appl.message);
                    print(word);
                    validationService.addMessage(addOrUpdate: true,
                        text: appl.message,
                        translate: word,
                        type: 0,
                        from: user1,
                        to: int.parse(roomModel!.user2Id),
                        documentId:roomModel!.fireBaseChatId,
                        docField: "ff");
                    validationService.updateLastMessage
                      (appl.message, appl.chatId.toString());
                  } else {
                    final response = await validationService.addChat(
                        user1, roomModel!.user2Id,
                        roomModel!.fireBaseChatId);
                    validationService.addMessage(addOrUpdate: true,
                        text: appl.message,
                        translate: appl.message,
                        type: 0,
                        from: user1,
                        to: int.parse(roomModel!.user2Id),
                        documentId: roomModel!.fireBaseChatId,
                        docField: "ff");
                    /*      setState(() {
                  appl.chatId = response;



                });
*/
                    appl.chatId = response;
                    validationService.updateLastMessage(appl.message, response);
                  }
                },
                    icon: Image.asset(
                      "assests/Icon ionic-ios-send.png", width: 20,)),

              ],),
            ),),
          );
        });
  }

}