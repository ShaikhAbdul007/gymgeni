class TodayFinanceModel {
  bool? status;
  String? message;
  TodayFinanceData? data;

  TodayFinanceModel({this.status, this.message, this.data});

  TodayFinanceModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null ? TodayFinanceData.fromJson(json['data']) : null;
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

class TodayFinanceData {
  String? date;
  int? totalSales;
  List<SalesDetails>? salesDetails;

  TodayFinanceData({this.date, this.totalSales, this.salesDetails});

  TodayFinanceData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    totalSales = json['total_sales'];
    if (json['sales_details'] != null) {
      salesDetails = <SalesDetails>[];
      json['sales_details'].forEach((v) {
        salesDetails!.add(SalesDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['total_sales'] = totalSales;
    if (salesDetails != null) {
      data['sales_details'] = salesDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SalesDetails {
  String? memberName;
  int? amountPaid;
  dynamic paymentMode;
  String? createdAt;

  SalesDetails({
    this.memberName,
    this.amountPaid,
    this.paymentMode,
    this.createdAt,
  });

  SalesDetails.fromJson(Map<String, dynamic> json) {
    memberName = json['member_name'];
    amountPaid = json['amount_paid'];
    paymentMode = json['payment_mode'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_name'] = memberName;
    data['amount_paid'] = amountPaid;
    data['payment_mode'] = paymentMode;
    data['created_at'] = createdAt;
    return data;
  }
}
