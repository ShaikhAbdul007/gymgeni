class EmployeeTypeUpdateModel {
  bool? status;
  String? message;
  EmployeeTypeUpdateData? data;

  EmployeeTypeUpdateModel({this.status, this.message, this.data});

  EmployeeTypeUpdateModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null
            ? EmployeeTypeUpdateData.fromJson(json['data'])
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

class EmployeeTypeUpdateData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  EmployeeTypeUpdateData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  EmployeeTypeUpdateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    createdByEmail = json['created_by_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['created_by_email'] = createdByEmail;
    return data;
  }
}
