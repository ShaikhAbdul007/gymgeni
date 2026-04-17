class MemberUpdateTrainingTypeModel {
  final bool? status;
  final String? message;
  final MemberUpdatetrainingTypeData? memberAddGroupData;
  MemberUpdateTrainingTypeModel({
    this.memberAddGroupData,
    this.message,
    this.status,
  });

  factory MemberUpdateTrainingTypeModel.fromJson(Map<String, dynamic> json) {
    return MemberUpdateTrainingTypeModel(
      memberAddGroupData: MemberUpdatetrainingTypeData.fromJson(
        json['data'] ?? {},
      ),
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

class MemberUpdatetrainingTypeData {
  String? id;
  String? name;
  String? updatedByEmail;

  MemberUpdatetrainingTypeData({this.updatedByEmail, this.id, this.name});

  factory MemberUpdatetrainingTypeData.fromJson(Map<String, dynamic> json) {
    return MemberUpdatetrainingTypeData(
      updatedByEmail: json['updated_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'updated_by_email': updatedByEmail, 'id': id, 'name': name};
  }
}
