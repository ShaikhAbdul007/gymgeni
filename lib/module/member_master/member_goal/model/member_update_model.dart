class MemberUpdateGoalModel {
  final bool? status;
  final String? message;
  final MemberUpdateGoalData? memberAddGoalData;
  MemberUpdateGoalModel({this.memberAddGoalData, this.message, this.status});

  factory MemberUpdateGoalModel.fromJson(Map<String, dynamic> json) {
    return MemberUpdateGoalModel(
      memberAddGoalData: MemberUpdateGoalData.fromJson(json['data'] ?? {}),
      message: json['msg'],
      status: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': status,
      'msg': message,
      'data': memberAddGoalData?.toJson(),
    };
  }
}

class MemberUpdateGoalData {
  String? id;
  String? name;
  String? updatedByEmail;

  MemberUpdateGoalData({this.updatedByEmail, this.id, this.name});

  factory MemberUpdateGoalData.fromJson(Map<String, dynamic> json) {
    return MemberUpdateGoalData(
      updatedByEmail: json['updated_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'updated_by_email': updatedByEmail, 'id': id, 'name': name};
  }
}
