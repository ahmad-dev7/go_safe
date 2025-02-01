class UserModel {
  String? id;
  String? email;
  String? phoneNumber;
  String? name;
  Null profilePicture;
  int? iV;

  UserModel({this.id, this.email, this.phoneNumber, this.name, this.profilePicture, this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['profilePicture'] = profilePicture;
    data['__v'] = iV;
    return data;
  }
}
