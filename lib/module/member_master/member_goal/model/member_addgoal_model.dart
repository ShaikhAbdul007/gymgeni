class MemberAddGoalModel {
  final bool? status;
  final String? message;
  final MemberAddGoalData? memberAddGoalData;
  MemberAddGoalModel({this.memberAddGoalData, this.message, this.status});

  factory MemberAddGoalModel.fromJson(Map<String, dynamic> json) {
    return MemberAddGoalModel(
      memberAddGoalData: MemberAddGoalData.fromJson(json['data'] ?? {}),
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

class MemberAddGoalData {
  String? id;
  String? name;
  String? createdByEmail;

  MemberAddGoalData({this.createdByEmail, this.id, this.name});

  factory MemberAddGoalData.fromJson(Map<String, dynamic> json) {
    return MemberAddGoalData(
      createdByEmail: json['created_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'created_by_email': createdByEmail, 'id': id, 'name': name};
  }
}
