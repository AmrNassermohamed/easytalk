import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/Screens/room/widgets_room/fav_message_widget.dart';
import 'package:translationchat/Screens/room/widgets_room/last_message_widget.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/shared/components/progress.dart';


class LastMessageRoom extends StatelessWidget {
  const LastMessageRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return  Consumer<ChatProvider>(
        builder: (context, provider, child) {
          if (provider.listRoomsGeneralState.hasData) {
return LastMessageWidget(roomModelList: provider.listRoomsGeneralState.data);
           }else{
            //return progress();
            return Expanded(child: Container(color: Colors.white,child: progress()));
          }}
    );
  }
}

class LastActiveRoom extends StatelessWidget {
  const LastActiveRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ChatProvider>(
        builder: (context, provider, child) {
          if (provider.listActiveState.hasData) {
            return LastMessageWidget(
                roomModelList: provider.listActiveState.data);
          } else {
            return Expanded(
                child: Container(color: Colors.white, child: progress()));
         //   return progress();
          }
        }
    );
  }
}
  class LastFavRoom extends StatelessWidget {
  const LastFavRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  // TODO: implement build
  return  Consumer<ChatProvider>(
  builder: (context, provider, child) {
  if (provider.listFavGeneralState.hasData) {
return FavMessageWidget();
  }else{
    return SizedBox(height: 10);
  }}
  );
  }
  }