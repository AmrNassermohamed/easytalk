import 'package:flutter/cupertino.dart';
import 'package:translationchat/data/userdata.dart';

import 'package:translationchat/models/providergeneralstate.dart';
import 'package:translationchat/models/usermodel.dart';


class UserProvider extends ChangeNotifier {
  late ProviderGeneralState<UserModel> listUserProfileGeneralState;
  UserData userData=UserData();
  String? mobileNumber;
  var countryCode="20";
  var countryName="eg";
  late bool loginOrNot;
  getToken(mobileNumber) {
    try {
   final response  = userData.getToken(mobileNumber);
   return response;
    } catch (ex) {
      return 1;
    }
  }


  checkCode(smsCode) async {
    try {
      var value = await userData.checkCode(smsCode: smsCode);
      print("/////////////////");
      print(value);
      return value;
    } catch (ex) {
      rethrow;
    }
  }


  sendMobileNumber({required String mobileNumber}) {
    try {
      if (validateMobile(mobileNumber)) {
        userData.getMobileNumber(mobileNumber: mobileNumber,countryCode:countryCode );
        return 0;
      } else {
        return 1;
      }
    } catch (ex) {
      rethrow;
    }
  }

  logout() {
    try {
      userData.logOut();
    } catch (ex) {
      rethrow;
    }
  }


  signUp(
      {required String name, required String email, required String mobileNumber}) {
    try {

email.trim();
if(validateEmail(email.replaceAll(" ", ""))&&validateMobile(mobileNumber.replaceAll(" ", ""))) {
  userData.signUp(
      name: name, email: email.replaceAll(' ', ''), mobileNumber: mobileNumber);
return 0;
}else{
  return 1;
}
    } catch (ex) {
      rethrow;
    }
  }

  validateEmail(String value) {
    value=value.trim().toString();
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value
        .replaceAll(" ", "")
        .isEmpty) {
      return false;
    } else if (value
        .replaceAll(" ", "")
        .length != 11) {
      return false;
    } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
      return false;
    }
    return true;
  }

  getUserProfile() async {
    try {
      UserModel ?userModel;
      setWaiting(0);
     userModel = await userData.getUserProfile();
      listUserProfileGeneralState =
          ProviderGeneralState(data: userModel, hasData: true);
      notifyListeners();
    } catch (ex) {
      rethrow;
    }
  }

  void setWaiting(index) {
    switch (index) {
      case 0:
        listUserProfileGeneralState = ProviderGeneralState(waiting: true);
        break;
    }
  }
}
