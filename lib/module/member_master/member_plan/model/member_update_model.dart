class MemberUpdatePlanModel {
  final bool? status;
  final String? message;
  final MemberUpdatePlanData? memberAddGroupData;
  MemberUpdatePlanModel({this.memberAddGroupData, this.message, this.status});

  factory MemberUpdatePlanModel.fromJson(Map<String, dynamic> json) {
    return MemberUpdatePlanModel(
      memberAddGroupData: MemberUpdatePlanData.fromJson(json['data'] ?? {}),
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

class MemberUpdatePlanData {
  String? id;
  String? name;
  String? updatedByEmail;

  MemberUpdatePlanData({this.updatedByEmail, this.id, this.name});

  factory MemberUpdatePlanData.fromJson(Map<String, dynamic> json) {
    return MemberUpdatePlanData(
      updatedByEmail: json['updated_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'updated_by_email': updatedByEmail, 'id': id, 'name': name};
  }
}
