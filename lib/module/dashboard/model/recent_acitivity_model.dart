class RecentActivityModel {
  bool? status;
  String? message;
  List<RecentActivityData>? data;

  RecentActivityModel({this.status, this.message, this.data});

  RecentActivityModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <RecentActivityData>[];
      json['data'].forEach((v) {
        data!.add(RecentActivityData.fromJson(v));
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

class RecentActivityData {
  String? id;
  String? name;
  String? image;
  String? createdAt;
  String? planName;
  String? imageUrl;

  RecentActivityData({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.planName,
    this.imageUrl,
  });

  RecentActivityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    planName = json['plan_name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['plan_name'] = planName;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
