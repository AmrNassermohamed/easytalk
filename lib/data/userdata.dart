import 'package:translationchat/services/firebasehandler.dart';
import 'package:translationchat/services/services_handler.dart';

class UserData {
  ServicesHandler service = ServicesHandler();
  FirebaseHandler firebaseHandler=FirebaseHandler();
  Future  getToken(String mobileNumber) async {
 try {
   var response = await service.
   postService(urlSuffix: "login?mobile_number=${mobileNumber.toString()}",
       returnBody: true).then((value) => value);
   String token = response["token"];
   return token;
 }catch(ex){
   rethrow;
 }
  }

 getMobileNumber({mobileNumber}){
try{
    firebaseHandler.phoneAuth("+20${mobileNumber.toString()}");
}catch(ex){
  rethrow;
}

}

checkCode({smsCode, verificationId}){
    try{
      firebaseHandler.checkCode(smsCode, verificationId);
    }catch(ex){
      rethrow;
    }
}

 logOut() async {
   try {
     var response = await service.
     postService(urlSuffix: "/logout",
         returnBody: false).then((value) => value);
     return response;
   }catch(ex){
     rethrow;
   }

 }


}