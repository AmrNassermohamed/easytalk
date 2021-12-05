

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translationchat/constants/strring.dart';
import 'package:translationchat/data/chatdata.dart';
import 'package:translationchat/models/ProviderGeneralState.dart';
import 'package:translationchat/models/contactmodel.dart';
import 'package:translationchat/models/favmodel.dart';
import 'package:translationchat/models/messagemodel.dart';
import 'package:translationchat/models/roommodel.dart';
import 'package:translationchat/utils/contacts.dart';

class ChatProvider extends ChangeNotifier{
  ChatData chatData= ChatData();
  List <Message>   messageList = [];
  bool settingLang=true;
  List <String> lang=["ar","en","fr","de","it"];
  String chosenLang="en";
  late ProviderGeneralState<List <ContactModel>> listContactsGeneralState=ProviderGeneralState(waiting: true);
  late ProviderGeneralState<List <RoomModel>> listRoomsGeneralState;
  late ProviderGeneralState<List <FavModel>> listFavGeneralState;
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
  addFav({fav,firebasehatId}) async {
    try{
    return chatData.addFav(fav,firebasehatId);


    }catch(ex){
      rethrow;
    }
  }
  deleteFav({fav}) async {
    try{
    return chatData.deleteFav(fav);


    }catch(ex){
      rethrow;
    }
  }
  getMessage(chatId) {
    try {


         return chatData.getMessage(chatId);
    } catch (ex) {
rethrow;
    }
  }
  printMessage(documentSnapshot) async {
    messageList.clear();
    messageList = [];

    try {
      if (documentSnapshot.data != null) {
      await documentSnapshot.data.data().forEach((key, value) {

Timestamp timestamp=value["creationDt"];
          messageList.add( Message(
            creationDt: timestamp.toDate(),
            message: value["message"].toString(),
            type: value["type"],
            translateMessage: value["translateMessage"],
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
  GetContacts getContacts=GetContacts();
getContact() async {
final contacts=await   GetContacts.fetchContacts();
return contacts;
}
addChat(user1,user2,chatId) async {
final response= await chatData.addChat(user1:user1,user2:user2,chatId:chatId);
return response;
}



getChats() async {
 try {
   List <RoomModel> getRoom = [];
   setWaiting(1);
   getRoom = await chatData.getChats();
   listRoomsGeneralState =
       ProviderGeneralState(data: getRoom, hasData: true);
   notifyListeners();
 }catch(ex){
   rethrow;
 }
}
  getFav() async {
    try {
      List <FavModel> getFav = [];
      setWaiting(2);
      getFav = await chatData.getFav();
     listFavGeneralState =
          ProviderGeneralState(data: getFav, hasData: true);
      notifyListeners();
    }catch(ex){
      rethrow;
    }
  }

  getListContacts(contacts) async {
    setWaiting(0);
  List <ContactModel> listContacts =await chatData.getContacts(contacts);
    listContactsGeneralState =
        ProviderGeneralState(data: listContacts, hasData: true);

    notifyListeners();
  }
  updateLastMessage(lastMessage,chatId) async {
  await chatData.updateLastMessage(lastMessage,chatId);
  }
  void setWaiting(index) {
    switch (index) {
      case 0:
        listContactsGeneralState = ProviderGeneralState(waiting: true);
        break;
      case 1:
        listRoomsGeneralState = ProviderGeneralState(waiting: true);
        break;
      case 2:
        listFavGeneralState = ProviderGeneralState(waiting: true);
        break;


    }
  }
}