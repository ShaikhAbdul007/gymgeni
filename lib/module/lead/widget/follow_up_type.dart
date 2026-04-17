import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_lead_data_table.dart';
import 'package:gymgeni/module/lead/model/all_lead_model.dart';

class FollowUpType extends StatelessWidget {
  final bool isDataLoading;
  final List<String> columnNames;
  final List<Leads> leads;
  const FollowUpType({
    super.key,
    required this.isDataLoading,
    required this.columnNames,
    required this.leads,
  });

  @override
  Widget build(BuildContext context) {
    return CommonLeadDataTable(
      columnNames: columnNames,
      leads: leads,
      isDataLoading: isDataLoading,
      noDataFound: 'No lead found',
    );
  }
}
