class LeadFollowUpTypeModel {
  bool? status;
  String? message;
  List<LeadFollowUpTypeData>? data;

  LeadFollowUpTypeModel({this.status, this.message, this.data});

  LeadFollowUpTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <LeadFollowUpTypeData>[];
      json['data'].forEach((v) {
        data!.add(LeadFollowUpTypeData.fromJson(v));
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

class LeadFollowUpTypeData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  LeadFollowUpTypeData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  LeadFollowUpTypeData.fromJson(Map<String, dynamic> json) {
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
