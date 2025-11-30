class MemberAllPlanModel {
  bool? status;
  String? message;
  List<MemberAllPlanData>? memberAllPlanData;

  MemberAllPlanModel({this.status, this.message, this.memberAllPlanData});

  MemberAllPlanModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      memberAllPlanData = <MemberAllPlanData>[];
      json['data'].forEach((v) {
        memberAllPlanData!.add(MemberAllPlanData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (memberAllPlanData != null) {
      data['data'] = memberAllPlanData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberAllPlanData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;
  int? durationMonths;
  String? price;

  MemberAllPlanData({this.id, this.name, this.createdAt, this.createdByEmail});

  MemberAllPlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    createdByEmail = json['created_by_email'];
    durationMonths = json['duration_months'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['created_by_email'] = createdByEmail;
    data['duration_months'] = durationMonths;
    data['price'] = price;

    return data;
  }
}
