import '../data/networking.dart';

class LeadFollowUpHistoryRepo {
  final networking = Networking();

  // Future<AllLeadModel> getALlLeadData() async {
  //   try {
  //     var res = await networking.getData(
  //       url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeads}',
  //     );
  //     return AllLeadModel.fromJson(res);
  //   } catch (e) {
  //     return throw (e);
  //   }
  // }
}
