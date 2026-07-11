import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_lead_data_table.dart';

import '../model/all_lead_model.dart';

class AllLead extends StatelessWidget {
  final bool isDataLoading;
  final List<String> columnNames;
  final List<Leads> leads;
  final void Function(Leads lead)? editOnTap;
  final void Function(Leads lead)? convertOnTap;
  const AllLead({
    super.key,
    required this.isDataLoading,
    required this.columnNames,
    required this.leads,
    this.editOnTap,
    this.convertOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonLeadDataTable(
      columnNames: columnNames,
      leads: leads,
      isDataLoading: isDataLoading,
      noDataFound: 'No lead found',
      editOnTap: editOnTap,
      convertOnTap: convertOnTap,
    );
  }
}
