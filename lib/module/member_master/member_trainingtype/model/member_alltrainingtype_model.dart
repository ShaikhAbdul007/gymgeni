class MemberAllTrainingTypeModel {
  bool? status;
  String? message;
  List<MemberAllTrainingTypeData>? memberAllTrainingTypeData;

  MemberAllTrainingTypeModel({
    this.status,
    this.message,
    this.memberAllTrainingTypeData,
  });

  MemberAllTrainingTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      memberAllTrainingTypeData = <MemberAllTrainingTypeData>[];
      json['data'].forEach((v) {
        memberAllTrainingTypeData!.add(MemberAllTrainingTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (memberAllTrainingTypeData != null) {
      data['data'] = memberAllTrainingTypeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberAllTrainingTypeData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  MemberAllTrainingTypeData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  MemberAllTrainingTypeData.fromJson(Map<String, dynamic> json) {
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
