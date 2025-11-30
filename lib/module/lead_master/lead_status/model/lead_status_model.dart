class LeadStatusModel {
  bool? status;
  String? message;
  List<LeadStatusData>? data;

  LeadStatusModel({this.status, this.message, this.data});

  LeadStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <LeadStatusData>[];
      json['data'].forEach((v) {
        data!.add(LeadStatusData.fromJson(v));
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

class LeadStatusData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  LeadStatusData({this.id, this.name, this.createdAt, this.createdByEmail});

  LeadStatusData.fromJson(Map<String, dynamic> json) {
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
