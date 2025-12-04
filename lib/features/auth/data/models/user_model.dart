
class UserModel {
  final String? name ;
  final String email ;
  final String? password ;
  final String? uid ;

  UserModel({required this.email,  this.name,this.password,this.uid,});

  Map<String,dynamic> toJson(){
    return {
      "name" : name ,
      "email" : email,
      "uid" : uid,
    };
  }

  factory UserModel.fromJson (Map<String,dynamic> json ){
    return UserModel(
        email: json["email"],
        name: json["name"],
        uid: json["uid"],
    );
  }


}