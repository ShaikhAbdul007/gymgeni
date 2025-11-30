import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/lead_master/lead_status/model/add_update_status_model.dart';
import '../module/lead_master/lead_status/model/lead_status_model.dart';

class LeadStatusRepo {
  final networking = Networking();

  Future<LeadStatusModel> getLeadStatus() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeadStatus}',
      );
      return LeadStatusModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateStatusModel> addLeadStatus(dynamic body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createLeadStatus}',
        body: body,
      );
      return AddUpdateStatusModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateStatusModel> updateLeadStatus(dynamic body) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateLeadStatus}',
        body: body,
      );
      return AddUpdateStatusModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateStatusModel> deletLeadStatus(dynamic body) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteLeadStatus}',
        body: body,
      );
      return AddUpdateStatusModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
