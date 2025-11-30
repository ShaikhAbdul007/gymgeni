import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/lead/model/add_lead_model.dart';
import '../module/lead/model/all_lead_model.dart';

class LeadRepo {
  final networking = Networking();

  Future<AllLeadModel> getALlLeadData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeads}',
      );
      return AllLeadModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddLeadModel> addNewLeadData(dynamic body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createLead}',
        body: body,
      );
      return AddLeadModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
