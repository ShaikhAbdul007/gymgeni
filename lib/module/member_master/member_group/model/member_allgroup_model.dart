class MemberAllGroupModel {
  bool? status;
  String? message;
  List<MemberAllGroupData>? memberAllGroupData;

  MemberAllGroupModel({this.status, this.message, this.memberAllGroupData});

  MemberAllGroupModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      memberAllGroupData = <MemberAllGroupData>[];
      json['data'].forEach((v) {
        memberAllGroupData!.add(MemberAllGroupData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (memberAllGroupData != null) {
      data['data'] = memberAllGroupData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberAllGroupData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  MemberAllGroupData({this.id, this.name, this.createdAt, this.createdByEmail});

  MemberAllGroupData.fromJson(Map<String, dynamic> json) {
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
