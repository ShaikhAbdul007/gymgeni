class MemberAddtrainingModel {
  final bool? status;
  final String? message;
  final MemberAddtrainingData? memberAddtrainingData;
  MemberAddtrainingModel({
    this.memberAddtrainingData,
    this.message,
    this.status,
  });

  factory MemberAddtrainingModel.fromJson(Map<String, dynamic> json) {
    return MemberAddtrainingModel(
      memberAddtrainingData: MemberAddtrainingData.fromJson(json['data'] ?? {}),
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

class MemberAddtrainingData {
  String? id;
  String? name;
  String? createdByEmail;

  MemberAddtrainingData({this.createdByEmail, this.id, this.name});

  factory MemberAddtrainingData.fromJson(Map<String, dynamic> json) {
    return MemberAddtrainingData(
      createdByEmail: json['created_by_email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'created_by_email': createdByEmail, 'id': id, 'name': name};
  }
}
