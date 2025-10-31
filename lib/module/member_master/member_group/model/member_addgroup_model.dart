class MemberAddGroupModel {
  final bool? status;
  final String? message;
  final MemberAddGroupData? memberAddtrainingData;
  MemberAddGroupModel({this.memberAddtrainingData, this.message, this.status});

  factory MemberAddGroupModel.fromJson(Map<String, dynamic> json) {
    return MemberAddGroupModel(
      memberAddtrainingData: MemberAddGroupData.fromJson(json['data'] ?? {}),
      message: json['msg'],
      status: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': status,
      'msg': message,
      'data': memberAddtrainingData?.toJson(),
    };
  }
}

class MemberAddGroupData {
  String? id;
  String? name;
  String? createdByEmail;

  MemberAddGroupData({this.createdByEmail, this.id, this.name});

  factory MemberAddGroupData.fromJson(Map<String, dynamic> json) {
    return MemberAddGroupData(
      createdByEmail: json['created_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'created_by_email': createdByEmail, 'id': id, 'name': name};
  }
}
