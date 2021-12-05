import 'dart:async';

import 'package:flutter/cupertino.dart' show   BuildContext, Center, Column, EdgeInsets,Key, State, StatefulWidget, TextEditingController, Widget;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translationchat/Screens/chat/chatscreen.dart';
import 'package:translationchat/Screens/chat/contactscreen.dart';
import 'package:translationchat/constants/colors.dart';
import 'package:translationchat/constants/strring.dart';
import 'package:translationchat/provider/chatprovider.dart';
import 'package:translationchat/provider/userprovider.dart';
import 'package:translationchat/shared/components/bottomsheetglobal.dart';
import 'package:translationchat/shared/components/drawer.dart';
import 'package:translationchat/shared/components/navigator.dart';
import 'package:translationchat/shared/components/progress.dart';
import 'package:translationchat/shared/components/sizedboxglobal.dart';

import 'package:translationchat/shared/components/textglobal.dart';
import 'package:translationchat/shared/widgets/circleavatatimage.dart';




class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);
  @override
  RoomScreenState createState() => RoomScreenState ();
}

class RoomScreenState extends State<RoomScreen> {
  // const _SignUpState({Key? key}) : super(key: key);const MyHomePage({Key? key, required this.title}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late final TextEditingController controller =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  init() {

    final validationService = Provider.of<ChatProvider>(
        context, listen: false);
     validationService.getFav();
    validationService.getChats();
  }
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ChatProvider>(context);
    final validationService2 = Provider.of<UserProvider>(context);
    return
       SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer:
            navigationDrawer()
          ,
            backgroundColor: darkCyan,
            body:
            Center(
                child: Container(
                  //padding: const EdgeInsets.only(10),
                  height: MediaQuery.of(context).size.height,
                  color: cyan,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 0,right: 0),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:  [
                          GestureDetector(onTap: (){
                            _scaffoldKey.currentState!.openDrawer();
                          },child: const Icon(Icons.menu,color: Colors.white,)),
                          const Icon(Icons.search,color: Colors.white,),
                        ],),
                      ),
Directionality(
 textDirection: TextDirection.rtl,
  child:   Padding(
      padding:const EdgeInsets.only(top: 10,left: 40,right: 40),
      child:   Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
        textGlobalWhiteBold14(context: context,text: "الرسائل"),
        textGlobalGreyBold13(context: context,text: "نشط الان"),

      ],),
  ),
),
sizedBoxGlobalHeight10(),
                      Expanded(child: Container(width: MediaQuery.of(context).size.width,decoration:BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),


                        color:green,

                      ),child: Directionality(textDirection: TextDirection.rtl,child:Column(children: [
                     Padding(
                       padding:const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                         textGlobalWhiteBold24(context: context,text: "..."),
                         textGlobalWhiteNormal16(context: context,text: "المتصلين المفضلين"),

                       ],),
                     ),

                       Consumer<ChatProvider>(
    builder: (context, provider, child) {
    if (provider.listFavGeneralState.hasData) {

   return SizedBox(
    height: 100,
    child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: provider.listFavGeneralState.data!.length,
    itemBuilder: (BuildContext context, int index) =>
    Padding(
    padding:const EdgeInsets.all(5),
    child: Column(children: [
    circleAvatarImage(null,false),
    textGlobalNormalWhite14(context: context,text: provider.listFavGeneralState.data![index].name)
    ],),
    )
    ),


    );
    }else{
      return const SizedBox(height: 0);
    }}),
                                Consumer<ChatProvider>(
      builder: (context, provider, child) {
      if (provider.listRoomsGeneralState.hasData) {

  return  Expanded(
                          child: Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),


                            color: Colors.grey.shade100,

                          ),child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(children: [

                              Expanded(child:  ListView.builder(
                                  itemCount: provider.listRoomsGeneralState.data!.length,
                                  itemBuilder: (BuildContext context,int index){
                                    return GestureDetector(
                                    onTap: (){

                                      AppNavigator.navigateTo(context, ChatScreen(
                                        roomBool: true,
                                          roomModel:
                                          provider.listRoomsGeneralState.data![index],
                                          user1: validationService2.
                                          listUserProfileGeneralState.data!.id));
                                    },
                                      child: Padding(
                                        padding:const EdgeInsets.only(left: 15.0,right:15.0,top: 15.0 ),
                                        child: Column(children: [
                                         FlatButton(
                                            onPressed: (){
                                              AppNavigator.navigateTo(context, ChatScreen(roomBool: true,roomModel: provider.listRoomsGeneralState.data![index],user1: validationService2.listUserProfileGeneralState.data!.id));

                                            },
                                            child: Container(
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                                Row(children: [   GestureDetector(onTap: (){
                                                  bottomSheetProfile( context: context,roomModel:  provider.listRoomsGeneralState.data![index]);

                                                },child: circleAvatarImage(provider.listRoomsGeneralState.data![index].imageUrl,false)),
                                                  sizedBoxGlobalWidth10(),
                                                  Column(children: [
                                                    textGlobalLightCyanNormal12(context: context,text: provider.listRoomsGeneralState.data![index].name),
                                                  Row(children: [ SizedBox(width: MediaQuery.of(context).size.width-200,child: textGlobalBlackBold13(context: context,text: provider.listRoomsGeneralState.data![index].lastMessage),
)]),
                                                  ],)
                                                ]),

                                               // textGlobalBlackNormal13(context: context,text: provider.listRoomsGeneralState.data![index].lastMessageTime),
                                              ],),
                                            ),
                                          )
                                          , const Divider(color: Colors.grey,thickness: 1,)
                                        ],),
                                      ),
                                    );
                                  }
                              ),),

                            ],),
                          ),),
                        );}else{
      return Expanded(child: Container(color: Colors.white,child: progress()));
      }}
      )
                      ],) ,)


                    /*  */))

                    ],),
                  ),
                )),floatingActionButton:  FloatingActionButton(
            elevation: 0.0,
            child:const  Icon(Icons.chat_bubble),
            backgroundColor: cyan,
            onPressed: () async {
           AppNavigator.navigateTo(context,const ContactScreen());
              // await validationService.getContact();
            }
        ),),

    );

  }



}
