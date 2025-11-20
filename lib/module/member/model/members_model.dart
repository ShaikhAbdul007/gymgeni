class MembersModel {
  bool? status;
  String? message;
  MemberModelData? data;

  MembersModel({this.status, this.message, this.data});

  MembersModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ? MemberModelData.fromJson(json['data']) : null;
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

class MemberModelData {
  int? page;
  int? pageSize;
  int? total;
  int? totalPages;
  List<Members>? members;

  MemberModelData({
    this.page,
    this.pageSize,
    this.total,
    this.totalPages,
    this.members,
  });

  MemberModelData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPages = json['totalPages'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['total'] = total;
    data['totalPages'] = totalPages;
    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  String? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? amount;
  String? balanceAmount;
  String? joiningDate;
  String? balanceDate;
  String? gender;
  String? address;
  String? image;
  String? createdAt;
  dynamic updatedAt;
  String? createdByEmail;
  String? planName;
  String? goalName;
  String? sourceName;
  String? trainingModeName;
  String? trainingTypeName;
  String? status;
  String? imageUrl;

  Members({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.amount,
    this.balanceAmount,
    this.joiningDate,
    this.balanceDate,
    this.gender,
    this.address,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.createdByEmail,
    this.planName,
    this.goalName,
    this.sourceName,
    this.trainingModeName,
    this.trainingTypeName,
    this.status,
    this.imageUrl,
  });

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    amount = json['amount'];
    balanceAmount = json['balance_amount'];
    joiningDate = json['joining_date'];
    balanceDate = json['balance_date'];
    gender = json['gender'];
    address = json['address'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdByEmail = json['created_by_email'];
    planName = json['plan_name'];
    goalName = json['goal_name'];
    sourceName = json['source_name'];
    trainingModeName = json['training_mode_name'];
    trainingTypeName = json['training_type_name'];
    status = json['status'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['amount'] = amount;
    data['balance_amount'] = balanceAmount;
    data['joining_date'] = joiningDate;
    data['balance_date'] = balanceDate;
    data['gender'] = gender;
    data['address'] = address;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by_email'] = createdByEmail;
    data['plan_name'] = planName;
    data['goal_name'] = goalName;
    data['source_name'] = sourceName;
    data['training_mode_name'] = trainingModeName;
    data['training_type_name'] = trainingTypeName;
    data['status'] = status;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
