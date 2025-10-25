class LoginModel {
  bool? success;
  String? message;
  LoginData? loginData;

  LoginModel({this.success, this.message, this.loginData});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      loginData: LoginData.fromJson(json['data'] ?? {}),
      message: json['msg'],
      success: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': success, 'msg': message, 'data': loginData?.toJson()};
  }
}

class LoginData {
  String? token;
  User? user;

  LoginData({this.token, this.user});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user?.toJson()};
  }
}

class User {
  String? id;
  String? email;
  int? roleId;
  String? userName;

  User({this.id, this.email, this.roleId, this.userName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      roleId: json['role_id'] ?? 0,
      userName: json['user_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'user_name': userName, 'role_id': roleId};
  }
}
