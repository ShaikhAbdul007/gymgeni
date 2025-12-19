import 'package:flutter/material.dart';

class DashBoardBusinessOverAllComponenetModel {
  final String label;
  final int amount;
  final String percentage;
  final String image;
  final Color color;
  final IconData icons;
  final Color iconsColor;

  DashBoardBusinessOverAllComponenetModel({
    required this.color,
    required this.label,
    required this.icons,
    required this.iconsColor,
    required this.amount,
    required this.percentage,
    required this.image,
  });
}

class DashboardModel {
  bool? status;
  String? message;
  DashboardData? data;

  DashboardModel({this.status, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    message = json['msg'];
    data = json['data'] != null ? DashboardData.fromJson(json['data']) : null;
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

class DashboardData {
  int? todayRevenue;
  int? weeklyRevenue;
  int? monthlyRevenue;
  int? totalRevenue;
  int? totalPendingBalance;
  int? totalMembers;
  int? activeMembers;
  int? expiringSoonMembers;
  int? presentMembersPercentage;

  DashboardData({
    this.todayRevenue,
    this.weeklyRevenue,
    this.monthlyRevenue,
    this.totalRevenue,
    this.totalPendingBalance,
    this.totalMembers,
    this.activeMembers,
    this.expiringSoonMembers,
    this.presentMembersPercentage,
  });

  DashboardData.fromJson(Map<String, dynamic> json) {
    todayRevenue = json['today_revenue'];
    weeklyRevenue = json['weekly_revenue'];
    monthlyRevenue = json['monthly_revenue'];
    totalRevenue = json['total_revenue'];
    totalPendingBalance = json['total_pending_balance'];
    totalMembers = json['total_members'];
    activeMembers = json['active_members'];
    expiringSoonMembers = json['expiring_soon_members'];
    presentMembersPercentage = json['present_members_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['today_revenue'] = todayRevenue;
    data['weekly_revenue'] = weeklyRevenue;
    data['monthly_revenue'] = monthlyRevenue;
    data['total_revenue'] = totalRevenue;
    data['total_pending_balance'] = totalPendingBalance;
    data['total_members'] = totalMembers;
    data['active_members'] = activeMembers;
    data['expiring_soon_members'] = expiringSoonMembers;
    data['present_members_percentage'] = presentMembersPercentage;
    return data;
  }
}
