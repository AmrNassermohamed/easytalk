class RoomModel{

late String chatId;
  late String name;
  late String fireBaseChatId;
  late String lastMessage="";
  String lastMessageTime;
  late String user2Id;
  late String imageUrl;
  late String email;
  late var favoriteId;
  late String mobileNumber;

  RoomModel({required this.favoriteId,required this.imageUrl,required this.user2Id,required this.chatId,required this.lastMessageTime,
  required this.name,required this.email,required this.lastMessage,required this.mobileNumber,required this.fireBaseChatId,required });

  factory RoomModel.fromJson(Map<String, dynamic> json){

    return RoomModel(favoriteId: json["favorite_id"],imageUrl: json["user2"]["image_url"],email: json["user2"]["email"],mobileNumber: json["user2"]["mobile_number"],user2Id: json["user2"]["id"].toString(),chatId: json["chat_id"].toString(),fireBaseChatId: json["firebase_chat_id"],
lastMessage: json["last_message_received"]==null?"":json["last_message_received"],name: json["user2"]["name"],lastMessageTime: json["updated_at"] );
  }
}