import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translationchat/constants/colors.dart';



class TextFieldGlobal extends StatelessWidget{
  TextFieldGlobal({Key? key,  required this.controller,required this.hint,required this.label,required this .widthBorder}) : super(key: key);
  final TextEditingController controller ;
  final String hint;
  final double widthBorder;
  final Color label;
  late FocusNode myFocusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
    textDirection: TextDirection.rtl,
      child:
       TextField(

//textInputAction: TextInputAction.next,

        style:GoogleFonts.cairo(fontSize: 10,color:Colors.black,fontWeight: FontWeight.bold),

       // autocorrect: true,
        focusNode: myFocusNode,
          cursorColor: darkCyan,

          controller: controller,
        decoration:  InputDecoration(
          hintStyle: GoogleFonts.cairo(fontSize: 13,color:Colors.black12,fontWeight: FontWeight.bold),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:label, width: widthBorder),
          ),
            enabledBorder:UnderlineInputBorder(
              borderSide: BorderSide(color:label, width: widthBorder),
            ) ,

          border:  UnderlineInputBorder(
            borderSide: BorderSide(color: label, width: 0.0),
      ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
       hoverColor: darkCyan,
       fillColor: darkCyan,
            focusColor: darkCyan,

            hintText: hint,
        ),


      ),
    );
  }
}