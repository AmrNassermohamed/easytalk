import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/shared/components/displaysnackbar.dart';
import 'package:translationchat/shared/components/textglobal.dart';

bottomSheetGlobal({required BuildContext context}) {
  showModalBottomSheet(

      isScrollControlled: true,
      context: context,
      elevation: 0,
      barrierColor: Colors.black.withAlpha(1),
      backgroundColor: Colors.transparent,
      builder: (context) {
  final   validationService = Provider.of<ChatProvider>(context);

   return       Container(
              height:400,

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.all(Radius.circular(25.0)) ,
              ),
              child: Center(



  child:ListView.builder(
      itemCount: validationService.lang.length,
      itemBuilder: (context, index) {
   return FlatButton(onPressed: (){
     validationService.chosenLang=validationService.lang[index];
     validationService.notifyListeners();
//displaySnackBar(context, validationService.chosenLang);
         Navigator.of(context).pop();
   },child:Row(children: [ Center(child:Padding(padding: EdgeInsets.all(20),child: textGlobalDarkCyanBold13(context: context, text: validationService.lang[index])))],)); },))



  );});
}