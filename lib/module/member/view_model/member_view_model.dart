import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/members_model.dart';

class MemberViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController alternateContactNo = TextEditingController();
  TextEditingController goal = TextEditingController();
  TextEditingController healthCondition = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController source = TextEditingController();
  TabController? tabController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> durationList = [
    '1 Month',
    '3 Month',
    '6 Month',
    '12 Month',
  ];

  final List<String> genderList = ['Male', 'Female', 'Other'];

  final List<String> goalList = [
    'Weight Loss',
    'Fat Loss',
    'Weight Gain',
    'Muscle Gain',
    'Strength Training',
  ];

  final List<String> trainingTypeList = ['Normal', 'Personal Training'];

  final List<String> columnNames = [
    'Member',
    'Plan',
    'Amount',
    'Balance',
    'Status',
    'Join Date',
    'Expire Date',
    'Action',
  ];

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeEndDrawer();
  }

  final List<Member> members = [
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Sarah',
      subtitle: 'Regular Member',
      plan: 'Gold Plan',
      status: 'Active',
      amount: '3000',
      balanceAmount: '3000',
      date: '01-01-2024', // Join Date
      rejectDate: '01-07-2024', // Static Reject Date (6 months after join date)
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Janine',
      amount: '4000',
      balanceAmount: '2000',
      subtitle: 'Premium Member',
      plan: 'Silver Plan',
      status: 'Inactive',
      date: '10-02-2024',
      rejectDate: '10-08-2024',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'William',
      subtitle: 'VIP Member',
      amount: '5000',
      balanceAmount: '1000',
      plan: 'Platinum Plan',
      status: 'Pending',
      date: '05-03-2024',
      rejectDate: '05-09-2024',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Michael',
      subtitle: 'Regular Member',
      plan: 'Gold Plan',
      amount: '2000',
      balanceAmount: '4000',
      status: 'Active',
      date: '12-04-2024',
      rejectDate: '12-10-2024',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Emily',
      subtitle: 'Premium Member',
      plan: 'Silver Plan',
      status: 'Expired',
      date: '20-05-2024',
      amount: '1000',
      balanceAmount: '5000',
      rejectDate: '20-11-2024',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'John',
      subtitle: 'VIP Member',
      plan: 'Platinum Plan',
      amount: '1000',
      balanceAmount: '5000',
      status: 'Active',
      date: '15-06-2024',
      rejectDate: '15-12-2024',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Olivia',
      subtitle: 'Regular Member',
      plan: 'Gold Plan',
      amount: '1000',
      balanceAmount: '5000',
      status: 'Inactive',
      date: '08-07-2024',
      rejectDate: '08-01-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'David',
      subtitle: 'Premium Member',
      plan: 'Silver Plan',
      amount: '1000',
      balanceAmount: '5000',
      status: 'Expired',
      date: '22-08-2024',
      rejectDate: '22-02-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Sophia',
      subtitle: 'VIP Member',
      amount: '6000',
      balanceAmount: '00',
      plan: 'Platinum Plan',
      status: 'Inactive',
      date: '30-09-2024',
      rejectDate: '30-03-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Daniel',
      subtitle: 'Regular Member',
      plan: 'Gold Plan',
      amount: '2000',
      balanceAmount: '3000',
      status: 'Pending',
      date: '14-10-2024',
      rejectDate: '14-04-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Mia',
      subtitle: 'Premium Member',
      plan: 'Silver Plan',
      status: 'Inactive',
      amount: '2000',
      balanceAmount: '3000',
      date: '25-11-2024',
      rejectDate: '25-05-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Ethan',
      subtitle: 'VIP Member',
      plan: 'Platinum Plan',
      amount: '2000',
      balanceAmount: '3000',
      status: 'Active',
      date: '05-12-2024',
      rejectDate: '05-06-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Ava',
      subtitle: 'Regular Member',
      amount: '2000',
      balanceAmount: '3000',
      plan: 'Gold Plan',
      status: 'Expired',
      date: '12-01-2025',
      rejectDate: '12-07-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'James',
      amount: '2000',
      balanceAmount: '3000',
      subtitle: 'Premium Member',
      plan: 'Silver Plan',
      status: 'Active',
      date: '28-02-2025',
      rejectDate: '28-08-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Charlotte',
      subtitle: 'VIP Member',
      plan: 'Platinum Plan',
      amount: '2000',
      balanceAmount: '3000',
      status: 'Inactive',
      date: '07-03-2025',
      rejectDate: '07-09-2025',
    ),
    Member(
      image: 'assets/femaleemp.jpg',
      name: 'Benjamin',
      subtitle: 'Regular Member',
      amount: '2000',
      balanceAmount: '3000',
      plan: 'Gold Plan',
      status: 'Active',
      date: '18-04-2025',
      rejectDate: '18-10-2025',
    ),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }
}
