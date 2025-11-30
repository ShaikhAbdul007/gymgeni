import 'package:gymgeni/module/lead_master/lead_source/model/lead_source_model.dart';

import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/lead_master/lead_source/model/add_update_source_model.dart';

class SourceRepo {
  final networking = Networking();

  Future<LeadSourceModel> getSource() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeadSource}',
      );
      return LeadSourceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateSourceModel> addSource(dynamic body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createLeadSource}',
        body: body,
      );
      return AddUpdateSourceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateSourceModel> updateSource(dynamic body) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateLeadSource}',
        body: body,
      );
      return AddUpdateSourceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<AddUpdateSourceModel> deletSource(dynamic body) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteLeadSource}',
        body: body,
      );
      return AddUpdateSourceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
