class CreatNewEmployeeModel {
  bool? status;
  String? message;
  CreatNewEmployeeData? data;

  CreatNewEmployeeModel({this.status, this.message, this.data});

  CreatNewEmployeeModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null
            ? CreatNewEmployeeData.fromJson(json['data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CreatNewEmployeeData {
  String? id;
  String? name;
  String? userId;
  String? createdByEmail;
  dynamic updatedByEmail;
  dynamic deletedByEmail;
  String? email;
  String? gender;
  String? type;
  String? groupId;
  String? mobileNumber;
  String? userName;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? dateOfBirth;
  String? dateOfAnniversary;
  String? joiningDate;
  String? address;
  dynamic image;

  CreatNewEmployeeData({
    this.id,
    this.name,
    this.userId,
    this.createdByEmail,
    this.updatedByEmail,
    this.deletedByEmail,
    this.email,
    this.gender,
    this.type,
    this.groupId,
    this.mobileNumber,
    this.userName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.dateOfBirth,
    this.dateOfAnniversary,
    this.joiningDate,
    this.address,
    this.image,
  });

  CreatNewEmployeeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    createdByEmail = json['created_by_email'];
    updatedByEmail = json['updated_by_email'];
    deletedByEmail = json['deleted_by_email'];
    email = json['email'];
    gender = json['gender'];
    type = json['type'];
    groupId = json['group_id'];
    mobileNumber = json['mobile_number'];
    userName = json['user_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    dateOfBirth = json['date_of_birth'];
    dateOfAnniversary = json['date_of_anniversary'];
    joiningDate = json['joining_date'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_id'] = userId;
    data['created_by_email'] = createdByEmail;
    data['updated_by_email'] = updatedByEmail;
    data['deleted_by_email'] = deletedByEmail;
    data['email'] = email;
    data['gender'] = gender;
    data['type'] = type;
    data['group_id'] = groupId;
    data['mobile_number'] = mobileNumber;
    data['user_name'] = userName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['date_of_birth'] = dateOfBirth;
    data['date_of_anniversary'] = dateOfAnniversary;
    data['joining_date'] = joiningDate;
    data['address'] = address;
    data['image'] = image;
    return data;
  }
}
