class LeadCategoryModel {
  bool? status;
  String? message;
  List<LeadCategoryData>? data;

  LeadCategoryModel({this.status, this.message, this.data});

  LeadCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <LeadCategoryData>[];
      json['data'].forEach((v) {
        data!.add(LeadCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeadCategoryData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  LeadCategoryData({this.id, this.name, this.createdAt, this.createdByEmail});

  LeadCategoryData.fromJson(Map<String, dynamic> json) {
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
