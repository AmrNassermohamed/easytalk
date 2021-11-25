import 'package:translationchat/services/firebasehandler.dart';
import 'package:translationchat/services/services_handler.dart';

class ChatData{
FireStoreServices fireStoreServices=FireStoreServices();
ServicesHandler service = ServicesHandler();
  updateMessage({required text,required  int type,required int from, required int to,required documentId,required docField}) {
    Map<String, dynamic> data = type == 0
        ? {
      "message": text,
      "creationDt": DateTime.now(),
      "type": "text",
      "from": from,
      "to": to,
    } : {
      "creationDt": DateTime.now(),

      "type": "image",
      "message": text,
      "from": from,
      "to": to,
    } ;
    print(data);
    if(text.toString().isNotEmpty) {
      from < to
          ? documentId = from.toString() + "_" + to.toString()
          : documentId = to.toString() + "_" + from.toString();




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
    throw ex;
  }
}
Future translateWord(String target,String message) async{
 var headers = {
    'Authorization': 'Bearer 5|8D5ZdLIVPD30XK8bwoLw4OztHaqxRqH9vvSr9Qdf'
  };
var response= await service.
  postService(headers: headers,urlSuffix: "translate?target=${target.toString()}&message={$message}",returnBody: true ).then((value) => value);
print("///////////////////////");
 String word=response["translated_message"];
 final withoutEquals =word .replaceAll(RegExp('}'), '').replaceAll(RegExp('{'), '');
 print(withoutEquals);
 return withoutEquals;
}



}