
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseHandler{
  FirebaseAuth auth = FirebaseAuth.instance;

  Future phoneAuth( number) async {
    String ? verificationIdd;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+2001150061654",
      verificationCompleted: (PhoneAuthCredential credential) {

      },
      verificationFailed: (FirebaseAuthException e) {},

      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {
       print(verificationId);
        verificationIdd=verificationId;

      },
    );
print(verificationIdd);
return verificationIdd;
  }
  Future <bool> checkCode(smsCode, String  verificationId) async {
    bool value=false;
    try{
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithCredential(phoneAuthCredential).then((valuee) {

        if(valuee.user!.emailVerified==true){
          value=true;
        }
      });
      return value;
      //await auth.signInWithCredential(phoneAuthCredential);
    }catch(ex){

      return value;
    }



  }


}
