class MemberAllTrainingModel {
  bool? status;
  String? message;
  List<MemberAllTrainingData>? memberAllTrainingData;

  MemberAllTrainingModel({
    this.status,
    this.message,
    this.memberAllTrainingData,
  });

  MemberAllTrainingModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      memberAllTrainingData = <MemberAllTrainingData>[];
      json['data'].forEach((v) {
        memberAllTrainingData!.add(MemberAllTrainingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (memberAllTrainingData != null) {
      data['data'] = memberAllTrainingData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberAllTrainingData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  MemberAllTrainingData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  MemberAllTrainingData.fromJson(Map<String, dynamic> json) {
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
