class UserModel {
  String? id;
  String? email;
  String? phoneNumber;
  String? name;
  String? profilePicture;

  UserModel({
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.profilePicture,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['profilePicture'] = profilePicture;
    return data;
  }
}
