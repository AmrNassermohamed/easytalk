import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translationchat/Screens/auth/login.dart';
import 'package:translationchat/Screens/checknumberphone/checknumberphone.dart';
import 'package:translationchat/Screens/contactus/contactus.dart';
import 'package:translationchat/Screens/settings/settings.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textglobal.dart';
import 'package:translationchat/shared/widgets/circleavatatimage.dart';

import 'navigator.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: cyan,
        child: Column(

          children: <Widget>[
            sizedBoxGlobalHeight20(),

            createDrawerHeader(context),
            sizedBoxGlobalHeight20(),
createImageItem(context: context, onTap: (){}),
            createDrawerBodyItem(
context: context,
              icon: Icons.vpn_key_sharp,
              text: 'الحساب',
              onTap: () =>(){}

            ),
            createDrawerBodyItem(
              context: context,
                icon: Icons.add_ic_call_rounded,
              text: 'اتصل بنا',
              onTap: (){
                AppNavigator.navigateTo(context,const ContactUs ());
              }

            ),

            createDrawerBodyItem(
context: context,
              icon: Icons.settings,
              text: 'الضبط',
              onTap: (){
                AppNavigator.navigateTo(context,const Settings());
              }

            ),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Divider(thickness: 2,color: darkCyan,)),

            GestureDetector(
             onTap: (){

             },
              child: createDrawerBodyItem(
                  context: context,
                  icon: Icons.person_add_alt_1_sharp,
                  text: 'دعوه صديق',
                  onTap: (){
                    AppNavigator.navigateTo(context,const CheckNumberPhone());
                  }

              ),
            ),
            
            Expanded(child: Container()),
            createDrawerBodyItem(
                context: context,
                icon: Icons.exit_to_app,
                text: 'تسجيل الخروج',
                onTap: () async {
                  final pref = await SharedPreferences.getInstance();
                await pref.clear();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);

                }

            ),sizedBoxGlobalHeight20(),

          ],
        ),
      ),
    );
  }
}Widget createDrawerBodyItem(
    {required BuildContext context,required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(icon,color: Colors.white,),
        Padding(
          padding: EdgeInsets.only(left: 35.0),
          child: textGlobalWhiteBold14(context: context,text: text),
        ),
        sizedBoxGlobalWidth20(),
      ],
    ),
    onTap: onTap,
  );
}
Widget createImageItem(
    {required BuildContext context, required GestureTapCallback onTap}) {
  final validationService2 = Provider.of<UserProvider>(
      context, listen: false);
  if(validationService2.listUserProfileGeneralState.hasData==true){
  return ListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
       circleAvatarImage(),
        Padding(
          padding:const EdgeInsets.only(left: 35.0),
          child: textGlobalWhiteBold14(context: context,text: validationService2.listUserProfileGeneralState.data!.name),
        ),
        sizedBoxGlobalWidth20(),
      ],
    ),
    onTap: onTap,
  );
}else{
    return Text("");
  }
}
Widget createDrawerHeader(BuildContext context) {
  return

    ListTile   (
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [


                Icon(Icons.arrow_back_ios,color: white,size: 30,),

                textGlobalWhiteBold28(context: context,text: "الاعدادت"),
          sizedBoxGlobalWidth20(),

        ]),
      );
}
