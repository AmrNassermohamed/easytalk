import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart'
    show
        BuildContext,

        Key,
        State,
        StatefulWidget,
        TextEditingController,
        Widget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/Screens/chat/chat_screen_copy.dart';
import 'package:translationchat/Screens/room/room_body.dart';
import 'package:translationchat/models/roommodel.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'package:translationchat/shared/components/navigator.dart';
import 'package:translationchat/shared/utils/firebase_messaging.dart';



class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);
  @override
  RoomScreenState createState() => RoomScreenState();
}

class RoomScreenState extends State<RoomScreen> {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);

  late final TextEditingController controller = TextEditingController();

 Future<void>  setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    final validationService = Provider.of<ChatProvider>(context, listen: false);
    final validationService2 = Provider.of<UserProvider>(context,listen: false);

    await FirebaseMessaging.instance.getInitialMessage();
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

          RoomModel roomModel = RoomModel(favoriteId: 0,
     imageUrl: "", user2Id:message.data["user2_id"], chatId: "",
      lastMessageTime: "", name: message.data["user2_name"], email: "",
    lastMessage: "",
     mobileNumber: "", fireBaseChatId: message.data["firebase_chat_id"]);

        AppNavigator.navigateTo(context, ChatScreen(
            roomBool: true,
            roomModel:
            roomModel,
            user1: validationService2.
            listUserProfileGeneralState.data!.idModify));
      });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
       validationService.getChats();
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init() async {
    final validationService = Provider.of<ChatProvider>(context, listen: false);
    validationService.getChats();
     setupInteractedMessage();
    validationService.getFav();
    validationService.getActives();

  }
  @override
  Widget build(BuildContext context) {
 return RoomBody();

  }
}