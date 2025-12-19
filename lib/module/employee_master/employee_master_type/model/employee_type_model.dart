class EmployeeTypeModel {
  bool? status;
  String? message;
  List<EmployeeTypeData>? employeeTypeData;

  EmployeeTypeModel({this.status, this.message, this.employeeTypeData});

  EmployeeTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      employeeTypeData = <EmployeeTypeData>[];
      json['data'].forEach((v) {
        employeeTypeData!.add(EmployeeTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (employeeTypeData != null) {
      data['data'] = employeeTypeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeTypeData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  EmployeeTypeData({this.id, this.name, this.createdAt, this.createdByEmail});

  EmployeeTypeData.fromJson(Map<String, dynamic> json) {
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
