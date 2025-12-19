class PieStatsModel {
  bool? status;
  String? message;
  PieStatsData? data;

  PieStatsModel({this.status, this.message, this.data});

  PieStatsModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ? PieStatsData.fromJson(json['data']) : null;
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

class PieStatsData {
  int? monthlyPercentage;
  int? quarterlyPercentage;
  int? yearlyPercentage;

  PieStatsData({
    this.monthlyPercentage,
    this.quarterlyPercentage,
    this.yearlyPercentage,
  });

  PieStatsData.fromJson(Map<String, dynamic> json) {
    monthlyPercentage = json['monthly_percentage'];
    quarterlyPercentage = json['quarterly_percentage'];
    yearlyPercentage = json['yearly_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['monthly_percentage'] = monthlyPercentage;
    data['quarterly_percentage'] = quarterlyPercentage;
    data['yearly_percentage'] = yearlyPercentage;
    return data;
  }
}
