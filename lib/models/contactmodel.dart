class ContactModel {

  late String name;
  late String email;
  late String mobileNumber;
 // late String imagePath;
  late int id;
  late bool isBanned;
  late bool isActive;

  ContactModel({required this.name,required this.email,required
  this.mobileNumber,required this.id,
   // required this.imagePath
    required this.isActive,required this.isBanned});

  factory ContactModel.fromJson(Map<String, dynamic> json){

    return ContactModel(name: json["name"], email: json["email"],
        id: json["id"],
        mobileNumber: json["mobile_number"],
        isBanned: json["is_banned"],
       // imagePath: json["image_path"],
        isActive: json["is_active"]);

  }
}