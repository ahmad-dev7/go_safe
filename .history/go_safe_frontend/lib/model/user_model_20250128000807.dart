class UserModel {
  bool? status;
  String? message;
  User? user;

  UserModel({this.status, this.message, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? phoneNumber;
  String? name;
  Null profilePicture;
  int? iV;

  User({this.sId, this.email, this.phoneNumber, this.name, this.profilePicture, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['profilePicture'] = profilePicture;
    data['__v'] = iV;
    return data;
  }
}
