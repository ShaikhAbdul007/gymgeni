class ExpiryMemberModel {
  bool? status;
  String? message;
  ExpiryMemberData? data;

  ExpiryMemberModel({this.status, this.message, this.data});

  ExpiryMemberModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null ? ExpiryMemberData.fromJson(json['data']) : null;
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

class ExpiryMemberData {
  int? page;
  int? pageSize;
  int? total;
  int? totalPages;
  List<ExpiryMembers>? members;

  ExpiryMemberData({
    this.page,
    this.pageSize,
    this.total,
    this.totalPages,
    this.members,
  });

  ExpiryMemberData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPages = json['totalPages'];
    if (json['members'] != null) {
      members = <ExpiryMembers>[];
      json['members'].forEach((v) {
        members!.add(ExpiryMembers.fromJson(v));
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

class ExpiryMembers {
  String? id;
  String? name;
  String? imageUrl;
  String? email;
  String? planName;
  String? mobileMumber;
  String? expiryDate;

  ExpiryMembers({
    this.id,
    this.name,
    this.imageUrl,
    this.email,
    this.planName,
    this.mobileMumber,
    this.expiryDate,
  });

  ExpiryMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    email = json['email'];
    planName = json['plan_name'];
    mobileMumber = json['mobile_mumber'];
    expiryDate = json[' expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['email'] = email;
    data['plan_name'] = planName;
    data['mobile_mumber'] = mobileMumber;
    data[' expiry_date'] = expiryDate;
    return data;
  }
}
