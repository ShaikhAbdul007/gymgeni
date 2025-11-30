class AllEmployeeModel {
  bool? status;
  String? message;
  AllEmployeeData? data;

  AllEmployeeModel({this.status, this.message, this.data});

  AllEmployeeModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ? AllEmployeeData.fromJson(json['data']) : null;
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

class AllEmployeeData {
  int? page;
  int? pageSize;
  int? total;
  int? totalPages;
  List<Employees>? employees;

  AllEmployeeData({
    this.page,
    this.pageSize,
    this.total,
    this.totalPages,
    this.employees,
  });

  AllEmployeeData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPages = json['totalPages'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['total'] = total;
    data['totalPages'] = totalPages;
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  String? id;
  String? name;
  String? gender;
  String? contactNo;
  String? username;
  String? employeeTypeName;
  String? dateOfBirth;
  String? dateOfAnniversary;
  String? joiningDate;
  String? address;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? createdByEmail;
  String? imageUrl;

  Employees({
    this.id,
    this.name,
    this.gender,
    this.contactNo,
    this.username,
    this.employeeTypeName,
    this.dateOfBirth,
    this.dateOfAnniversary,
    this.joiningDate,
    this.address,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.createdByEmail,
    this.imageUrl,
  });

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    contactNo = json['contact_no'];
    username = json['username'];
    employeeTypeName = json['employee_type_name'];
    dateOfBirth = json['date_of_birth'];
    dateOfAnniversary = json['date_of_anniversary'];
    joiningDate = json['joining_date'];
    address = json['address'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdByEmail = json['created_by_email'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['contact_no'] = contactNo;
    data['username'] = username;
    data['employee_type_name'] = employeeTypeName;
    data['date_of_birth'] = dateOfBirth;
    data['date_of_anniversary'] = dateOfAnniversary;
    data['joining_date'] = joiningDate;
    data['address'] = address;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by_email'] = createdByEmail;
    data['image_url'] = imageUrl;
    return data;
  }
}
