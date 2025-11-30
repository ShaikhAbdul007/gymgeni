class AllLeadModel {
  bool? status;
  String? message;
  AllLeadData? data;

  AllLeadModel({this.status, this.message, this.data});

  AllLeadModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ? AllLeadData.fromJson(json['data']) : null;
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

class AllLeadData {
  int? page;
  int? pageSize;
  int? total;
  int? totalPages;
  List<Leads>? leads;

  AllLeadData({
    this.page,
    this.pageSize,
    this.total,
    this.totalPages,
    this.leads,
  });

  AllLeadData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    total = json['total'];
    totalPages = json['totalPages'];
    if (json['leads'] != null) {
      leads = <Leads>[];
      json['leads'].forEach((v) {
        leads!.add(Leads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['total'] = total;
    data['totalPages'] = totalPages;
    if (leads != null) {
      data['leads'] = leads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leads {
  String? id;
  String? name;
  String? expectedDate;
  String? description;
  String? createdAt;
  String? image;
  String? createdByEmail;
  String? planName;
  String? leadcategoryName;
  String? leadfollowtypeName;
  String? leadsourceName;
  String? status;
  String? imageUrl;

  Leads({
    this.id,
    this.name,
    this.expectedDate,
    this.description,
    this.createdAt,
    this.image,
    this.createdByEmail,
    this.planName,
    this.leadcategoryName,
    this.leadfollowtypeName,
    this.leadsourceName,
    this.status,
    this.imageUrl,
  });

  Leads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    expectedDate = json['expected_date'];
    description = json['description'];
    createdAt = json['created_at'];
    image = json['image'];
    createdByEmail = json['created_by_email'];
    planName = json['plan_name'];
    leadcategoryName = json['leadcategory_name'];
    leadfollowtypeName = json['leadfollowtype_name'];
    leadsourceName = json['leadsource_name'];
    status = json['status'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['expected_date'] = expectedDate;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['created_by_email'] = createdByEmail;
    data['plan_name'] = planName;
    data['leadcategory_name'] = leadcategoryName;
    data['leadfollowtype_name'] = leadfollowtypeName;
    data['leadsource_name'] = leadsourceName;
    data['status'] = status;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
