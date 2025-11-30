import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/lead_master/lead_follow_type/model/add_update_lead_follow_up_type.dart';
import '../module/lead_master/lead_follow_type/model/lead_follow_type_model.dart';

class LeadMasterFollowTypeRepo {
  final networking = Networking();

  Future<LeadFollowUpTypeModel> getLeadMasterFollowType() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeadFollowType}',
      );
      return LeadFollowUpTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateLeadFollowUpTypeModel> addLeadMasterFollowType(
    dynamic body,
  ) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createLeadFollowType}',
        body: body,
      );
      return AddUpdateLeadFollowUpTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateLeadFollowUpTypeModel> updateLeadMasterFollowType(
    dynamic body,
  ) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateLeadFollowType}',
        body: body,
      );
      return AddUpdateLeadFollowUpTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateLeadFollowUpTypeModel> deletLeadMasterFollowType(
    dynamic body,
  ) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteLeadFollowType}',
        body: body,
      );
      return AddUpdateLeadFollowUpTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
