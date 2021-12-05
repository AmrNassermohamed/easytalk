class UserModel{
  late String name;
  late String email;
  late String mobileNumber;
  late String id;
  late String imagePath;

UserModel({required this.name,required this.mobileNumber,required this.email,required this.id,required this.imagePath});

  factory UserModel.fromJson(Map<String, dynamic> json){

    return UserModel(mobileNumber: json["mobile_number"],imagePath: json["image_url"],
        name: json["name"],email: json["email"],id: json["id"].toString() );
  }


}