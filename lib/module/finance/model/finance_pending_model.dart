class FinanceModel {
  bool? status;
  String? message;
  FinanceData? data;

  FinanceModel({this.status, this.message, this.data});

  FinanceModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ? FinanceData.fromJson(json['data']) : null;
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

class FinanceData {
  int? page;
  int? pageSize;
  int? total;
  int? totalPages;
  Filters? filters;
  List<Payments>? payments;

  FinanceData({
    this.page,
    this.pageSize,
    this.total,
    this.totalPages,
    this.filters,
    this.payments,
  });

  FinanceData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPages = json['totalPages'];
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['total'] = total;
    data['totalPages'] = totalPages;
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  String? status;

  Filters({this.status});

  Filters.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    return data;
  }
}

class Payments {
  String? id;
  String? memberName;
  String? paidAmount;
  String? pendingAmount;
  String? mode;
  String? status;
  String? date;
  String? imageUrl;
  String? planName;

  Payments({
    this.id,
    this.memberName,
    this.paidAmount,
    this.pendingAmount,
    this.mode,
    this.status,
    this.date,
    this.imageUrl,
    this.planName,
  });

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberName = json['member_name'];
    paidAmount = json['paid_amount'];
    pendingAmount = json['pending_amount'];
    mode = json['mode'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_name'] = memberName;
    data['paid_amount'] = paidAmount;
    data['pending_amount'] = pendingAmount;
    data['mode'] = mode;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}
