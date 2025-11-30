import 'package:gymgeni/data/networking.dart';

import '../data/apiendpoint.dart';
import '../module/lead_master/lead_categories/model/add_update_lead_master_categories_model.dart';
import '../module/lead_master/lead_categories/model/lead_categories_model.dart';

class LeadMasterCategoryRepo {
  final networking = Networking();

  Future<LeadCategoryModel> getLeadMasterCategory() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeadCategory}',
      );
      return LeadCategoryModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateLeadCategoryModel> addLeadMasterCategory(dynamic body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createEmployeeType}',
        body: body,
      );
      return AddUpdateLeadCategoryModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateLeadCategoryModel> updateLeadMasterCategory(
    dynamic body,
  ) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateLeadCategory}',
        body: body,
      );
      return AddUpdateLeadCategoryModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateLeadCategoryModel> deletLeadMasterCategory(
    dynamic body,
  ) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteLeadCategory}',
        body: body,
      );
      return AddUpdateLeadCategoryModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
