class RoomModel{

late String chatId;
  late String name;
  late String fireBaseChatId;
  late String lastMessage="";
  String lastMessageTime;
  late String user2Id;

  RoomModel({required this.user2Id,required this.chatId,required this.lastMessageTime,
  required this.name,required this.lastMessage,required this.fireBaseChatId,required });

  factory RoomModel.fromJson(Map<String, dynamic> json){

    return RoomModel(user2Id: json["user2"]["id"].toString(),chatId: json["chat_id"].toString(),fireBaseChatId: json["firebase_chat_id"],
lastMessage: json["last_message_received"]==null?"":json["last_message_received"],name: json["user2"]["name"],lastMessageTime: json["updated_at"] );
  }
}