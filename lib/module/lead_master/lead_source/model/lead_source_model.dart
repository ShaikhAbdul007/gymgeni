class LeadSourceModel {
  bool? status;
  String? message;
  List<LeadSourceData>? data;

  LeadSourceModel({this.status, this.message, this.data});

  LeadSourceModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <LeadSourceData>[];
      json['data'].forEach((v) {
        data!.add(LeadSourceData.fromJson(v));
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

class LeadSourceData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  LeadSourceData({this.id, this.name, this.createdAt, this.createdByEmail});

  LeadSourceData.fromJson(Map<String, dynamic> json) {
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
