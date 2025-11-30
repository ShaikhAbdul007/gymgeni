class AllPaymentModel {
  bool? status;
  String? message;
  List<AllPaymentData>? data;

  AllPaymentModel({this.status, this.message, this.data});

  AllPaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <AllPaymentData>[];
      json['data'].forEach((v) {
        data!.add(AllPaymentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllPaymentData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  AllPaymentData({this.id, this.name, this.createdAt, this.createdByEmail});

  AllPaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    createdByEmail = json['created_by_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['created_by_email'] = createdByEmail;
    return data;
  }
}
