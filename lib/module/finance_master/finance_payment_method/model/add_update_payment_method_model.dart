class AddUpdatePaymentModel {
  bool? status;
  String? message;
  AddUpdatePaymentData? data;

  AddUpdatePaymentModel({this.status, this.message, this.data});

  AddUpdatePaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null
            ? AddUpdatePaymentData.fromJson(json['data'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = status;
    data['msg'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddUpdatePaymentData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  AddUpdatePaymentData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  AddUpdatePaymentData.fromJson(Map<String, dynamic> json) {
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
