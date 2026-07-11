import 'package:flutter/material.dart';

import '../view_model/member_view_model.dart';
import 'create_new_member.dart';

class EditMemberDrawer extends StatelessWidget {
  final MemberViewModel controller;
  const EditMemberDrawer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CreateNewMember(
      controller: controller,
      headerLabel: 'Edit Details',
      submitLabel: 'Update',
    );
  }
}
