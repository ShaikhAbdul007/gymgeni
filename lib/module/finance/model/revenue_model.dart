class RevenueModel {
  bool? status;
  String? message;
  RevenueData? data;

  RevenueModel({this.status, this.message, this.data});

  RevenueModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ?  RevenueData.fromJson(json['data']) : null;
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

class RevenueData {
  int? todayRevenue;

  RevenueData({this.todayRevenue});

  RevenueData.fromJson(Map<String, dynamic> json) {
    todayRevenue = json['today_revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['today_revenue'] = todayRevenue;
    return data;
  }
}
