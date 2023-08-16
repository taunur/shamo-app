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
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.roles,
    required this.profilePhotoUrl,
    required this.token,
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
