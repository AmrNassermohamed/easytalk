class UserModel{
  late String name;
  late String email;
  late String mobileNumber;
  late String id;
UserModel({required this.name,required this.mobileNumber,required this.email,required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json){

    return UserModel(mobileNumber: json["mobile_number"],
        name: json["name"],email: json["email"],id: json["id"].toString() );
  }


}