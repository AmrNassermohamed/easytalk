import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:translationchat/constants/strring.dart';
import 'package:translationchat/data/chatdata.dart';
import 'package:translationchat/models/message.dart';

class ChatProvider extends ChangeNotifier{
  ChatData chatData= ChatData();
  List <Message>   messageList = [];
  addMessage({required bool addOrUpdate,required text,required  int type,required int from, required int to,required documentId,required docField}){
    try{


      chatData.updateMessage(text: text, type: type,
          from: from, to: to, documentId: documentId, docField: addOrUpdate==true?getRandomString():docField);

    }catch(ex){
      rethrow;
    }
  }
  translateWord({target,message}) async {
    try{
  String word   = await chatData.translateWord(target, message);
 return word;

    }catch(ex){
      rethrow;
    }
  }
  getMessage(from,to) {
    try {

   String   documentId = to.toString() + "_" + from.toString();
         return chatData.getMessage(documentId);
    } catch (ex) {
      throw ex;
    }
  }
  printMessage(documentSnapshot) async {
    messageList.clear();
    messageList = [];

    try {
      if (documentSnapshot.data != null) {
        var element = await documentSnapshot.data.data().forEach((key, value) {

Timestamp timestamp=value["creationDt"];
          messageList.add( Message(
            creationDt: timestamp.toDate(),
            message: value["message"].toString(),
            type: value["type"],
            to: value["to"],
                    from: value["from"], documentId: key,
          ));
          messageList.sort();

        });
      }
    }catch(ex){
      print("error get msg list "+ex.toString());
    }
  }


}