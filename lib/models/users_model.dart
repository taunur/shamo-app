class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? roles;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.roles,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    roles = json['roles'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': email,
      'username': username,
      'phone': phone,
      'roles': roles,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
