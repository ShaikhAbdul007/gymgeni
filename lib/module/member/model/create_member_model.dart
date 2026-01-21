class CreateMemberModel {
  bool? status;
  String? message;
  CreateMemberData? data;

  CreateMemberModel({this.status, this.message, this.data});

  CreateMemberModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data =
        json['data'] != null ? CreateMemberData.fromJson(json['data']) : null;
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

class CreateMemberData {
  String? id;
  String? name;
  String? gender;
  String? mobileNumber;
  String? alternateMobile;
  String? email;
  int? age;
  String? planId;
  String? trainingModeId;
  String? trainingTypeId;
  String? goalId;
  String? sourceId;
  String? groupId;
  String? healthCondition;
  String? address;
  String? joiningDate;
  String? amount;
  String? balanceAmount;
  String? balanceDate;
  String? createdAt;
  dynamic updatedAt;
  String? createdByUser;
  dynamic deletedAt;
  dynamic deletedByEmail;
  dynamic updatedByEmail;
  String? statusFlag;
  dynamic transferredFrom;
  String? paymentMode;
  String? originalJoiningDate;
  dynamic frozenAt;
  dynamic image;
  String? discount;
  String? adjustedAmount;
  String? createdByEmail;
  BmrData? bmr;
  String? status;
  int? planPrice;

  CreateMemberData({
    this.id,
    this.name,
    this.gender,
    this.mobileNumber,
    this.alternateMobile,
    this.email,
    this.age,
    this.planId,
    this.trainingModeId,
    this.trainingTypeId,
    this.goalId,
    this.sourceId,
    this.groupId,
    this.healthCondition,
    this.address,
    this.joiningDate,
    this.amount,
    this.balanceAmount,
    this.balanceDate,
    this.createdAt,
    this.updatedAt,
    this.createdByUser,
    this.deletedAt,
    this.deletedByEmail,
    this.updatedByEmail,
    this.statusFlag,
    this.transferredFrom,
    this.paymentMode,
    this.originalJoiningDate,
    this.frozenAt,
    this.image,
    this.discount,
    this.adjustedAmount,
    this.createdByEmail,
    this.bmr,
    this.status,
    this.planPrice,
  });

  CreateMemberData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    mobileNumber = json['mobile_number'];
    alternateMobile = json['alternate_mobile'];
    email = json['email'];
    age = json['age'];
    planId = json['plan_id'];
    trainingModeId = json['training_mode_id'];
    trainingTypeId = json['training_type_id'];
    goalId = json['goal_id'];
    sourceId = json['source_id'];
    groupId = json['group_id'];
    healthCondition = json['health_condition'];
    address = json['address'];
    joiningDate = json['joining_date'];
    amount = json['amount'];
    balanceAmount = json['balance_amount'];
    balanceDate = json['balance_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdByUser = json['created_by_user'];
    deletedAt = json['deleted_at'];
    deletedByEmail = json['deleted_by_email'];
    updatedByEmail = json['updated_by_email'];
    statusFlag = json['status_flag'];
    transferredFrom = json['transferred_from'];
    paymentMode = json['payment_mode'];
    originalJoiningDate = json['original_joining_date'];
    frozenAt = json['frozen_at'];
    image = json['image'];
    discount = json['discount'];
    adjustedAmount = json['adjusted_amount'];
    createdByEmail = json['created_by_email'];
    bmr = json['bmr'] != null ? BmrData.fromJson(json['bmr']) : null;
    status = json['status'];
    planPrice = json['plan_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['mobile_number'] = mobileNumber;
    data['alternate_mobile'] = alternateMobile;
    data['email'] = email;
    data['age'] = age;
    data['plan_id'] = planId;
    data['training_mode_id'] = trainingModeId;
    data['training_type_id'] = trainingTypeId;
    data['goal_id'] = goalId;
    data['source_id'] = sourceId;
    data['group_id'] = groupId;
    data['health_condition'] = healthCondition;
    data['address'] = address;
    data['joining_date'] = joiningDate;
    data['amount'] = amount;
    data['balance_amount'] = balanceAmount;
    data['balance_date'] = balanceDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by_user'] = createdByUser;
    data['deleted_at'] = deletedAt;
    data['deleted_by_email'] = deletedByEmail;
    data['updated_by_email'] = updatedByEmail;
    data['status_flag'] = statusFlag;
    data['transferred_from'] = transferredFrom;
    data['payment_mode'] = paymentMode;
    data['original_joining_date'] = originalJoiningDate;
    data['frozen_at'] = frozenAt;
    data['image'] = image;
    data['discount'] = discount;
    data['adjusted_amount'] = adjustedAmount;
    data['created_by_email'] = createdByEmail;
    if (bmr != null) {
      data['bmr'] = bmr!.toJson();
    }
    data['status'] = status;
    data['plan_price'] = planPrice;
    return data;
  }
}

class BmrData {
  String? createdAt;
  String? updatedAt;
  String? id;
  String? memberId;
  String? gender;
  int? age;
  String? weight;
  int? height;
  String? heartRateRest;
  String? heartRateTreadmill;
  String? pushUp;
  String? curlUp;
  String? mobility;
  String? sitReach;
  String? profession;
  String? workTimeStart;
  String? workTimeEnd;
  String? meal1Time;
  String? meal2Time;
  String? meal3Time;
  String? aims;
  int? chest;
  int? hips;
  int? stomach;
  int? thigh;
  int? bodyAge;
  String? createdByUser;
  dynamic meal4Time;
  dynamic updatedByEmail;
  dynamic deletedByEmail;
  dynamic deletedAt;

  BmrData({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.memberId,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.heartRateRest,
    this.heartRateTreadmill,
    this.pushUp,
    this.curlUp,
    this.mobility,
    this.sitReach,
    this.profession,
    this.workTimeStart,
    this.workTimeEnd,
    this.meal1Time,
    this.meal2Time,
    this.meal3Time,
    this.aims,
    this.chest,
    this.hips,
    this.stomach,
    this.thigh,
    this.bodyAge,
    this.createdByUser,
    this.meal4Time,
    this.updatedByEmail,
    this.deletedByEmail,
    this.deletedAt,
  });

  BmrData.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    memberId = json['member_id'];
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    heartRateRest = json['heart_rate_rest'];
    heartRateTreadmill = json['heart_rate_treadmill'];
    pushUp = json['push_up'];
    curlUp = json['curl_up'];
    mobility = json['mobility'];
    sitReach = json['sit_reach'];
    profession = json['profession'];
    workTimeStart = json['work_time_start'];
    workTimeEnd = json['work_time_end'];
    meal1Time = json['meal1_time'];
    meal2Time = json['meal2_time'];
    meal3Time = json['meal3_time'];
    aims = json['aims'];
    chest = json['chest'];
    hips = json['hips'];
    stomach = json['stomach'];
    thigh = json['thigh'];
    bodyAge = json['body_age'];
    createdByUser = json['created_by_user'];
    meal4Time = json['meal4_time'];
    updatedByEmail = json['updated_by_email'];
    deletedByEmail = json['deleted_by_email'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['id'] = id;
    data['member_id'] = memberId;
    data['gender'] = gender;
    data['age'] = age;
    data['weight'] = weight;
    data['height'] = height;
    data['heart_rate_rest'] = heartRateRest;
    data['heart_rate_treadmill'] = heartRateTreadmill;
    data['push_up'] = pushUp;
    data['curl_up'] = curlUp;
    data['mobility'] = mobility;
    data['sit_reach'] = sitReach;
    data['profession'] = profession;
    data['work_time_start'] = workTimeStart;
    data['work_time_end'] = workTimeEnd;
    data['meal1_time'] = meal1Time;
    data['meal2_time'] = meal2Time;
    data['meal3_time'] = meal3Time;
    data['aims'] = aims;
    data['chest'] = chest;
    data['hips'] = hips;
    data['stomach'] = stomach;
    data['thigh'] = thigh;
    data['body_age'] = bodyAge;
    data['created_by_user'] = createdByUser;
    data['meal4_time'] = meal4Time;
    data['updated_by_email'] = updatedByEmail;
    data['deleted_by_email'] = deletedByEmail;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
