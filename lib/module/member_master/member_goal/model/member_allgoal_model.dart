class MemberAllGoalModel {
  bool? status;
  String? message;
  List<MemberAllGoalData>? memberAllGoalData;

  MemberAllGoalModel({this.status, this.message, this.memberAllGoalData});

  MemberAllGoalModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      memberAllGoalData = <MemberAllGoalData>[];
      json['data'].forEach((v) {
        memberAllGoalData!.add(MemberAllGoalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (memberAllGoalData != null) {
      data['data'] = memberAllGoalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberAllGoalData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  MemberAllGoalData({this.id, this.name, this.createdAt, this.createdByEmail});

  MemberAllGoalData.fromJson(Map<String, dynamic> json) {
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
