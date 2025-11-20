class UserDataModel {
  bool? success;
  String? msg;
  UserData? data;

  UserDataModel({this.success, this.msg, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? userName;
  String? gymName;
  String? phoneNumber;
  String? email;
  String? gymImage;
  String? role;
  String? location;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  UserData({
    this.id,
    this.userName,
    this.gymName,
    this.phoneNumber,
    this.email,
    this.gymImage,
    this.role,
    this.location,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    gymName = json['gym_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    gymImage = json['gym_image'];
    role = json['role'];
    location = json['location'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['gym_name'] = gymName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['gym_image'] = gymImage;
    data['role'] = role;
    data['location'] = location;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
