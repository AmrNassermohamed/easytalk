import 'package:translationchat/models/usermodel.dart';
import 'package:translationchat/services/firebasehandler.dart';
import 'package:translationchat/services/services_handler.dart';
import 'package:translationchat/utils/sharedprefence.dart';

class UserData {
  ServicesHandler service = ServicesHandler();
  FirebaseHandler firebaseHandler=FirebaseHandler();
  Future  getToken(String mobileNumber) async {
 try {
   var response = await service.
   postService(urlSuffix: "login?mobile_number=${mobileNumber.toString()}",
       returnBody: true).then((value) => value);
   String token = response["token"];
   await SharedPreferenceHandler.setToken(token);

   return 0;
 }catch(ex){
   return 1;
 }
  }

 getMobileNumber({mobileNumber,countryCode}){
try{

    firebaseHandler.phoneAuth("+${countryCode.toString()}${mobileNumber.toString()}");
}catch(ex){
  rethrow;
}

}

checkCode({smsCode}) async{
    try{

  var value   = await firebaseHandler.checkCode(smsCode);

   return value;
    }catch(ex){
      return false;
    }
}

 logOut() async {
   try {
     var response = await service.
     postService(urlSuffix: "logout",
         returnBody: false).then((value) => value);
     return response;
   }catch(ex){
     rethrow;
   }

 }
 signUp({required String name,required String email,required String mobileNumber}) async {
   try {
     var response = await service.
     postService(urlSuffix: "register?name=${name.toString()}&email=${email.toString()}&mobile_number=${mobileNumber.toString()}",
         returnBody: false).then((value) => value);
     return response;
   }catch(ex){
     rethrow;
   }
 }
  getUserProfile() async {
    UserModel ? userModel;
    String token=await SharedPreferenceHandler.getToken();
    var headers = {
      'Authorization': 'Bearer ${token.toString()}'
    };
    var response= await ServicesHandler().
    getService(urlSuffix:"profile?",
        headers: headers, ex: true);


      userModel = UserModel.fromJson(response["user"]);


    return userModel;
  }




}