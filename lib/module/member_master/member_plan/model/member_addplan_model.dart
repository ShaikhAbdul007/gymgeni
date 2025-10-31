class MemberAddPlanModel {
  final bool? status;
  final String? message;
  final MemberAddPlanData? memberAddtrainingData;
  MemberAddPlanModel({this.memberAddtrainingData, this.message, this.status});

  factory MemberAddPlanModel.fromJson(Map<String, dynamic> json) {
    return MemberAddPlanModel(
      memberAddtrainingData: MemberAddPlanData.fromJson(json['data'] ?? {}),
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

class MemberAddPlanData {
  String? id;
  String? name;
  String? createdByEmail;

  MemberAddPlanData({this.createdByEmail, this.id, this.name});

  factory MemberAddPlanData.fromJson(Map<String, dynamic> json) {
    return MemberAddPlanData(
      createdByEmail: json['created_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'created_by_email': createdByEmail, 'id': id, 'name': name};
  }
}
