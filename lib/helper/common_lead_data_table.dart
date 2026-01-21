import 'package:flutter/material.dart';
import 'package:gymgeni/helper/common_nodatafound.dart';
import 'package:gymgeni/helper/common_progress_bar.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/dimension.dart';
import 'package:gymgeni/utils/colors.dart';
import '../module/lead/model/all_lead_model.dart';
import '../module/member_master/model/member_master_model.dart';
import '../utils/text_style.dart';
import 'common_action.dart';

class CommonLeadDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<Leads> leads;
  final VoidCallback? deleteOnTap;
  final VoidCallback? editOnTap;
  final bool isDataLoading;
  final String noDataFound;
  const CommonLeadDataTable({
    super.key,
    required this.columnNames,
    required this.leads,
    this.deleteOnTap,
    this.editOnTap,
    required this.isDataLoading,
    required this.noDataFound,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child:
            isDataLoading
                ? CommonProgressBar(circularProgressColor: AppColors.blackColor)
                : leads.isNotEmpty
                ? DataTable(
                  dataRowMinHeight: 8,
                  dataRowMaxHeight: 60,
                  columnSpacing: 10,
                  headingRowColor: WidgetStateColor.resolveWith(
                    (states) => AppColors.whiteColor,
                  ),
                  columns:
                      columnNames.map((columnName) {
                        return DataColumn(
                          label: Text(
                            columnName,
                            style: customPoppin(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                  rows:
                      leads.map((lead) {
                        return DataRow(
                          cells: [
                            DataCell(
                              ListTile(
                                leading: Container(
                                  width: 90,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Image.network(
                                    width: 200,
                                    height: 200,
                                    lead.imageUrl ?? '',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/user.png',
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.contain,
                                      );
                                    },
                                  ),
                                ),
                                title: Text(
                                  lead.name ?? '',
                                  style: customNunito(fontSize: 15),
                                ),
                                subtitle: Text(
                                  lead.name ?? '',
                                  style: customNunito(fontSize: 13),
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                lead.planName ?? '',
                                style: customNunito(fontSize: 12),
                              ),
                            ),
                            DataCell(
                              Text(
                                lead.description ?? '',
                                style: customNunito(fontSize: 12),
                              ),
                            ),
                            DataCell(
                              Text(
                                lead.status ?? '',
                                style: customNunito(fontSize: 12),
                              ),
                            ),
                            DataCell(
                              Text(
                                lead.expectedDate ?? '',
                                style: customNunito(fontSize: 12),
                              ),
                            ),
                            DataCell(
                              CommonAction(
                                deleteOnTap: deleteOnTap ?? () {},
                                editOnTap: editOnTap ?? () {},
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                )
                : CommonNoDataFound(label: noDataFound),
      ),
    );
  }
}

class CommonMasterMemberDataTable extends StatelessWidget {
  final List<String> columnNames;
  final List<MemberMasterModel> members;
  final VoidCallback? deleteOnTap;
  final VoidCallback? editOnTap;
  const CommonMasterMemberDataTable({
    super.key,
    required this.columnNames,
    required this.members,
    this.deleteOnTap,
    this.editOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: DataTable(
          dataRowMinHeight: 8,
          dataRowMaxHeight: 60,
          columnSpacing: 10,
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => AppColors.whiteColor,
          ),
          columns:
              columnNames.map((columnName) {
                return DataColumn(
                  label: Text(
                    columnName,
                    style: customPoppin(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
          rows:
              members.map((member) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(member.group, style: customNunito(fontSize: 12)),
                    ),

                    DataCell(
                      CommonAction(deleteOnTap: () {}, editOnTap: () {}),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
