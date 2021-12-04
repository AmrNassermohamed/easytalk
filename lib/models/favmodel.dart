class FavModel{

  late String chatId;
  late String name;
//  late String fireBaseChatId;
 // late String lastMessage="";
 // String lastMessageTime;
  late String user2Id;

  FavModel({required this.user2Id,required this.chatId,
  required this.name });

factory FavModel.fromJson(Map<String, dynamic> json){

return FavModel(user2Id: json["favorite"]["id"].toString(),chatId: json["chat_id"].toString(),
name: json["favorite"]["name"] );
}
}