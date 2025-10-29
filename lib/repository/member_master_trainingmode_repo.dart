import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';

import '../module/member_master/member_triaingmode/model/member_addtraining_model.dart';
import '../module/member_master/member_triaingmode/model/member_alltraining_model.dart';
import '../module/member_master/member_triaingmode/model/member_updatetraining_model.dart';

class TraingModeRepo {
  final networking = Networking();

  Future<MemberAddtrainingModel> addNewTraingMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.postData(
        url:
            '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createTrainingModeEndPoint}',
        body: body,
      );
      return MemberAddtrainingModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllTrainingModel> getTraingMode() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getTrainingMode}',
      );
      return MemberAllTrainingModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllTrainingUpdateModel> updateTraingMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateTrainingMode}',
        body: body,
      );
      return MemberAllTrainingUpdateModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllTrainingUpdateModel> deleteTraingMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteTrainingMode}',
        body: body,
      );
      return MemberAllTrainingUpdateModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
