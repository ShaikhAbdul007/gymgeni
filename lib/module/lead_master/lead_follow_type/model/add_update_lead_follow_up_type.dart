class AddUpdateLeadFollowUpTypeModel {
  bool? status;
  String? message;
  AddUpdateLeadFollowUpTypeData? data;

  AddUpdateLeadFollowUpTypeModel({this.status, this.message, this.data});

  AddUpdateLeadFollowUpTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null
            ? AddUpdateLeadFollowUpTypeData.fromJson(json['data'])
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

class AddUpdateLeadFollowUpTypeData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  AddUpdateLeadFollowUpTypeData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  AddUpdateLeadFollowUpTypeData.fromJson(Map<String, dynamic> json) {
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
