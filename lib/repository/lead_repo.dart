import 'dart:io';
import 'dart:typed_data';

import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/lead/model/add_lead_model.dart';
import '../module/lead/model/all_lead_model.dart';
import '../utils/constant.dart';

class LeadRepo {
  final networking = Networking();

  Future<AllLeadModel> getALlLeadData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getLeads}',
      );
      return AllLeadModel.fromJson(res);
    } catch (e) {
      return AllLeadModel(status: false, message: e.toString());
    }
  }

  Future<AddLeadModel> addNewLeadData({
    required Map<String, String> body,
    File? file,
    Uint8List? fileBytes,
    String? fileField,
    String? fileName,
  }) async {
    try {
      var res = await networking.postMultipartRequestData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.registerEndPoint}',
        body: body,
        file: file ?? File(''),
        fileBytes: fileBytes ?? Uint8List(0),
        fileField: fileField ?? '',
        fileName: fileName ?? '',
      );
      var leadModelRes = AddLeadModel.fromJson(res);
      Constant.customPrintLog('res is from multipart $leadModelRes');
      return leadModelRes;
    } catch (e) {
      return AddLeadModel(status: false, message: e.toString());
    }
  }
}
