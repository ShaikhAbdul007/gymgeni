class EmployeeAttendanceModel {
  bool? status;
  String? message;
  List<EmployeeAttendanceData>? data;

  EmployeeAttendanceModel({this.status, this.message, this.data});

  EmployeeAttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    if (json['data'] != null) {
      data = <EmployeeAttendanceData>[];
      json['data'].forEach((v) {
        data!.add(EmployeeAttendanceData.fromJson(v));
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

class EmployeeAttendanceData {
  String? attendanceId;
  String? memberName;
  String? groupName;
  String? trainingTypeName;
  String? checkInTime;
  String? checkOutTime;
  String? imageUrl;

  EmployeeAttendanceData({
    this.attendanceId,
    this.memberName,
    this.groupName,
    this.trainingTypeName,
    this.checkInTime,
    this.checkOutTime,
    this.imageUrl,
  });

  EmployeeAttendanceData.fromJson(Map<String, dynamic> json) {
    attendanceId = json['attendance_id'];
    memberName = json['member_name'];
    groupName = json['group_name'];
    trainingTypeName = json['training_type_name'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendance_id'] = attendanceId;
    data['member_name'] = memberName;
    data['group_name'] = groupName;
    data['training_type_name'] = trainingTypeName;
    data['check_in_time'] = checkInTime;
    data['check_out_time'] = checkOutTime;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
