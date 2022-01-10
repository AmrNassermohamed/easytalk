import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/shared/text_global.dart';

class MessageComponents extends StatelessWidget {

  int index;
  bool checkMessage;
  int user1;
  MessageComponents({ required this.index, required this.checkMessage,required this.user1});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ChatProvider>(context, listen: false);

    if(validationService.messageList[index].type=="image"){
     return  Container(
       height: 200,

         decoration: BoxDecoration(
           color: Colors.white
               ,
           borderRadius: const BorderRadius
               .only(
               bottomLeft: Radius
                   .circular(15),
               topRight: Radius
                   .circular(15)),
         ),
         child:


         Padding(
             padding: const EdgeInsets
                 .all(10.0),
             child: Image.network(validationService.messageList[index].message.toString(),height: 200,fit: BoxFit.fill,)));

    }else{

      return Container(
          decoration: BoxDecoration(
            color: validationService
                .messageList[index].from
                ==
                user1
                ? Colors.white
                : lightCyan,
            borderRadius: const BorderRadius
                .only(
                bottomLeft: Radius
                    .circular(15),
                topRight: Radius
                    .circular(15)),
          ),
          child:


          Padding(
              padding: const EdgeInsets
                  .all(10.0),
              child: validationService.
              messageList[index].from
                  ==
                  user1

                  ?
              textGlobalDarkCyanBold13(
                  context: context,


                  text: checkMessage == true ? validationService
                      .messageList[index]
                      .message : validationService.messageList[index]
                      .translateMessage)
                  : textGlobalWhiteBold14(
                  context: context,
                  text: checkMessage == true ? validationService
                      .messageList[index]
                      .translateMessage : validationService.messageList[index]
                      .translateMessage)));
    }
    }

}