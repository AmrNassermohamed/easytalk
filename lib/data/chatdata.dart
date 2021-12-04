import 'dart:convert';

import 'package:translationchat/models/contactmodel.dart';
import 'package:translationchat/models/favmodel.dart';
import 'package:translationchat/models/roommodel.dart';
import 'package:translationchat/services/firestorehandler.dart';
import 'package:translationchat/services/services_handler.dart';
import 'package:translationchat/utils/contacts.dart';
import 'package:translationchat/utils/sharedprefence.dart';

class ChatData{
FireStoreServices fireStoreServices=FireStoreServices();
ServicesHandler service = ServicesHandler();
  updateMessage({required text,required  int type,required int from, required int to,required documentId,required docField}) {
    Map<String, dynamic> data = type == 0
        ? {
      "message": text,
      "translateMessage":text,
      "creationDt": DateTime.now(),
      "type": "text",
      "from": from,
      "to": to,
    } :type==1? {
      "creationDt": DateTime.now(),
      "type": "image",
      "message": text,
      "from": from,
      "to": to,
    }:type==2?{
      "translateMessage":text,
    }:{} ;

    if(text.toString().isNotEmpty) {





      fireStoreServices.updateCollection(map: data,

          doc: documentId,
          docField:docField,
          collectionName: "chat");


    }

  }

getMessage(doc)  {
  try {
    return  fireStoreServices.getDataStream(documentId: doc,collectionName: "chat",where: false);
  }catch(ex){
  rethrow;
  }
}
Future translateWord(String target,String message) async{
 try {
   String token = await SharedPreferenceHandler.getToken();
   var headers = {
     'Authorization': 'Bearer ${token.toString()}'
   };
   var response = await service.
   postService(headers: headers,
       urlSuffix: "translate?target=${target.toString()}&message={$message}",
       returnBody: true).then((value) => value);

   String word = response["translated_message"];
   final withoutEquals = word.replaceAll(RegExp('}'), '').replaceAll(
       RegExp('{'), '');
   print(withoutEquals);
   return withoutEquals;
 }catch(ex){
   rethrow;
 }
}


updateLastMessage(String lastMessage,chatId) async {
  String token=await SharedPreferenceHandler.getToken();
  var headers = {
    'Authorization': 'Bearer ${token.toString()}'
  };
  var response= await service.putService
  (headers: headers,urlSuffix: "chats/${chatId.toString()}?last_message_received=${lastMessage.toString()}").then((value) => value);
  return response;

}
addChat({user1,user2,chatId}) async {
  String token=await SharedPreferenceHandler.getToken();
  var headers = {
    'Authorization': 'Bearer ${token.toString()}'
  };
  var response= await service.postService
    (returnBody: true,headers: headers,urlSuffix: "chats?user1=${user1.toString()}&user2=${user2.toString()}&firebase_chat_id=${chatId.toString()}").then((value) => value);
  return response["chat"]["id"];
}

getContacts(contacts) async {

    String token=await SharedPreferenceHandler.getToken();
    var headers = {
      'Authorization': 'Bearer ${token.toString()}'
    };
  List <ContactModel> listContact=[];
  var response= await ServicesHandler().
  postService(urlSuffix:"contacts?mobile_numbers=${contacts}",
      headers: headers,returnBody: true);
  print(response);
  response["contacts"].forEach((v) {
    ContactModel contactModel = ContactModel.fromJson(v);
    listContact.add(contactModel);
  });
  return listContact;
}
getChats() async {
    List <RoomModel> listRoom=[];
    String token=await SharedPreferenceHandler.getToken();
    var headers = {
      'Authorization': 'Bearer ${token.toString()}'
    };
    var response= await ServicesHandler().
    getService(urlSuffix:"chats?",
        headers: headers, ex: true);

    response["chats"].forEach((v) {
    RoomModel roomModel = RoomModel.fromJson(v);
    listRoom.add(roomModel);
  });
    return listRoom;
  }
getFav() async {

    List <FavModel> listFav=[];
    String token=await SharedPreferenceHandler.getToken();
    var headers = {
      'Authorization': 'Bearer ${token.toString()}'
    };
    var response= await ServicesHandler().
    getService(urlSuffix:"favorites?",
        headers: headers, ex: true);

    response["favorites"].forEach((v) {
      FavModel favModel = FavModel.fromJson(v);
      listFav.add(favModel);
    });
    return listFav;
  }
}




