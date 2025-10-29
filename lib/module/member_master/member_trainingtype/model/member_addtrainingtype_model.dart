class MemberAddtrainingTypeModel {
  final bool? status;
  final String? message;
  final MemberAddtrainingTypeData? memberAddtrainingData;
  MemberAddtrainingTypeModel({
    this.memberAddtrainingData,
    this.message,
    this.status,
  });

  factory MemberAddtrainingTypeModel.fromJson(Map<String, dynamic> json) {
    return MemberAddtrainingTypeModel(
      memberAddtrainingData: MemberAddtrainingTypeData.fromJson(
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
      'data': memberAddtrainingData?.toJson(),
    };
  }
}

class MemberAddtrainingTypeData {
  String? id;
  String? name;
  String? createdByEmail;

  MemberAddtrainingTypeData({this.createdByEmail, this.id, this.name});

  factory MemberAddtrainingTypeData.fromJson(Map<String, dynamic> json) {
    return MemberAddtrainingTypeData(
      createdByEmail: json['created_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'created_by_email': createdByEmail, 'id': id, 'name': name};
  }
}
