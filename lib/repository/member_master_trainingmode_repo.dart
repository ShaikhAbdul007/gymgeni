import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';

import '../module/member_master/member_triaingmode/model/member_addtraining_model.dart';
import '../module/member_master/member_triaingmode/model/member_alltraining_model.dart';
import '../module/member_master/member_triaingmode/model/member_updatetraining_model.dart';

class TraingModeRepo {
  final networking = Networking();

  Future<MemberAddTrainingModel> addNewTrainingMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.postData(
        url:
            '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createTrainingModeEndPoint}',
        body: body,
      );
      return MemberAddTrainingModel.fromJson(res);
    } catch (e) {
      return MemberAddTrainingModel(status: false, message: e.toString());
    }
  }

  Future<MemberAllTrainingModel> getTrainingMode() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getTrainingMode}',
      );
      return MemberAllTrainingModel.fromJson(res);
    } catch (e) {
      return MemberAllTrainingModel(status: false, message: e.toString());
    }
  }

  Future<MemberAllTrainingUpdateModel> updateTrainingMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateTrainingMode}',
        body: body,
      );
      return MemberAllTrainingUpdateModel.fromJson(res);
    } catch (e) {
      return MemberAllTrainingUpdateModel(status: false, message: e.toString());
    }
  }

  Future<MemberAllTrainingUpdateModel> deleteTrainingMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteTrainingMode}',
        body: body,
      );
      return MemberAllTrainingUpdateModel.fromJson(res);
    } catch (e) {
      return MemberAllTrainingUpdateModel(status: false, message: e.toString());
    }
  }
}
