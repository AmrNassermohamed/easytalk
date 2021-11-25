import 'package:flutter/cupertino.dart';
import 'package:translationchat/data/userData.dart';


class UserProvider extends ChangeNotifier{

  UserData userData =UserData();
   getToken(mobileNumber){
     try {
       userData.getToken(mobileNumber);
     }catch(ex){
 rethrow;
     }
   }

  sendMobileNumber() {
    try {
      userData.getMobileNumber();
    } catch (ex) {
      rethrow;
    }
  }

  logout(){
try{
 userData.logOut();
}catch(ex){
rethrow;
}
  }



}