import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'package:translationchat/shared/components/countrypicker.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';
import 'package:translationchat/shared/components/textfieldglobal.dart';
import 'package:translationchat/shared/text_global.dart';

Widget textFieldPhoneNumber(TextEditingController controller,BuildContext context){
  final validationService = Provider.of<UserProvider>(context);
  return   Container(decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),

  ),child: Padding(
    padding:const EdgeInsets.all(10)         ,
    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [

      //   SizedBox(width: 20,),

      Flexible(child:  TextFieldGlobal(label: Colors.black12,
        controller:controller ,hint: " +02 01150061654",widthBorder:2.0)),
      Icon(Icons.keyboard_arrow_down_sharp,color: black,),
      sizedBoxGlobalWidth10(),
      GestureDetector(onTap: (){
        showCountryPicker(
          context: context,
          showPhoneCode: true, // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            validationService.countryCode=country.phoneCode;
validationService.countryName=country.countryCode;
            validationService.notifyListeners();
          },
        );
      //  counteryPicker(context);
      },child: /*const  CircleAvatar
        (radius: 10,
          backgroundImage:
          NetworkImage("https://firebasestorage.googleapis.com/v0/b/okhtub-5a9d2.appspot.com/o/flags%2F149.png?alt=media&token=4f1cd246-f980-4957-942c-abd6190e3496")*/
      textGlobalBlackBold16(context: context,text: validationService.countryName)
      )
    ],),
  ));
}