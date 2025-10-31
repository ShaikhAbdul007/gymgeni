class MemberUpdateGroupModel {
  final bool? status;
  final String? message;
  final MemberUpdateGroupData? memberAddGroupData;
  MemberUpdateGroupModel({this.memberAddGroupData, this.message, this.status});

  factory MemberUpdateGroupModel.fromJson(Map<String, dynamic> json) {
    return MemberUpdateGroupModel(
      memberAddGroupData: MemberUpdateGroupData.fromJson(json['data'] ?? {}),
      message: json['msg'],
      status: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': status,
      'msg': message,
      'data': memberAddGroupData?.toJson(),
    };
  }
}

class MemberUpdateGroupData {
  String? id;
  String? name;
  String? updatedByEmail;

  MemberUpdateGroupData({this.updatedByEmail, this.id, this.name});

  factory MemberUpdateGroupData.fromJson(Map<String, dynamic> json) {
    return MemberUpdateGroupData(
      updatedByEmail: json['updated_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'updated_by_email': updatedByEmail, 'id': id, 'name': name};
  }
}
