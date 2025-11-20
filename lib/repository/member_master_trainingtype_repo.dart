import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';
import '../module/member_master/member_trainingtype/model/member_addtrainingtype_model.dart';
import '../module/member_master/member_trainingtype/model/member_alltrainingtype_model.dart';
import '../module/member_master/member_trainingtype/model/member_updatetrainingtype_model.dart';

class TraingTypeRepo {
  final networking = Networking();

  Future<MemberAddtrainingTypeModel> addNewTraingTypeMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createTrainingType}',
        body: body,
      );
      return MemberAddtrainingTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllTrainingTypeModel> getTraingTypeMode() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getTrainingType}',
      );
      return MemberAllTrainingTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdatetrainingTypeModel> updateTraingTypeMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateTrainingType}',
        body: body,
      );
      return MemberUpdatetrainingTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdatetrainingTypeModel> deleteTraingTypeMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteTrainingType}',
        body: body,
      );
      return MemberUpdatetrainingTypeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
