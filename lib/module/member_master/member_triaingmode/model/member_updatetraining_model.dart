class MemberAllTrainingUpdateModel {
  bool? status;
  String? message;
  MemberAllTrainingUpdateData? data;

  MemberAllTrainingUpdateModel({this.status, this.message, this.data});

  MemberAllTrainingUpdateModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null
            ? MemberAllTrainingUpdateData.fromJson(json['data'])
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

class MemberAllTrainingUpdateData {
  String? id;
  String? name;
  String? updatedAt;
  String? updatedByEmail;

  MemberAllTrainingUpdateData({
    this.id,
    this.name,
    this.updatedAt,
    this.updatedByEmail,
  });

  MemberAllTrainingUpdateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    updatedAt = json['updated_at'];
    updatedByEmail = json['updated_by_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['updated_at'] = updatedAt;
    data['updated_by_email'] = updatedByEmail;
    return data;
  }
}
