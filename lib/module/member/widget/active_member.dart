import 'package:flutter/material.dart';

import '../../../helper/common_data_table.dart';
import '../model/members_model.dart';
import '../view_model/member_view_model.dart';

class ActiveMemberWidget extends StatelessWidget {
  final List<String> columnNames;
  final List<Member> members;
  const ActiveMemberWidget({
    super.key,
    required this.columnNames,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return CommonMemberDataTable(columnNames: columnNames, members: members);
  }
}
