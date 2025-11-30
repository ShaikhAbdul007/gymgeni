class AddUpdateSourceModel {
  bool? status;
  String? message;
  AddUpdateSourceData? data;

  AddUpdateSourceModel({this.status, this.message, this.data});

  AddUpdateSourceModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null
            ? AddUpdateSourceData.fromJson(json['data'])
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

class AddUpdateSourceData {
  String? id;
  String? name;
  String? createdAt;
  String? createdByEmail;

  AddUpdateSourceData({
    this.id,
    this.name,
    this.createdAt,
    this.createdByEmail,
  });

  AddUpdateSourceData.fromJson(Map<String, dynamic> json) {
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
