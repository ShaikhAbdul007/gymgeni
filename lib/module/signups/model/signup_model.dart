class SignupModel {
  final bool? status;
  final String? message;
  final SingUpData? signUpData;
  SignupModel({this.signUpData, this.status, this.message});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      message: json['msg'] ?? '',
      signUpData: SingUpData.fromJson(json['data'] ?? {}),
      status: json['success'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {'success': status, 'msg': message, 'data': signUpData?.toJson()};
  }
}

class SingUpData {
  final String? id;
  final String? email;
  final String? roleId;
  SingUpData({this.email, this.id, this.roleId});

  factory SingUpData.fromJson(Map<String, dynamic> json) {
    return SingUpData(
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      roleId: json['roleId'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'roleId': roleId};
  }
}
