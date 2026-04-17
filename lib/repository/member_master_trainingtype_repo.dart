import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';
import '../module/member_master/member_trainingtype/model/member_addtrainingtype_model.dart';
import '../module/member_master/member_trainingtype/model/member_alltrainingtype_model.dart';
import '../module/member_master/member_trainingtype/model/member_updatetrainingtype_model.dart';

class TrainingTypeRepo {
  final networking = Networking();

  Future<MemberAddTrainingTypeModel> addNewTrainingTypeMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createTrainingType}',
        body: body,
      );
      return MemberAddTrainingTypeModel.fromJson(res);
    } catch (e) {
      return MemberAddTrainingTypeModel(status: false, message: e.toString());
    }
  }

  Future<MemberAllTrainingTypeModel> getTrainingTypeMode() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getTrainingType}',
      );
      return MemberAllTrainingTypeModel.fromJson(res);
    } catch (e) {
      return MemberAllTrainingTypeModel(status: false, message: e.toString());
    }
  }

  Future<MemberUpdateTrainingTypeModel> updateTrainingTypeMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateTrainingType}',
        body: body,
      );
      return MemberUpdateTrainingTypeModel.fromJson(res);
    } catch (e) {
      return MemberUpdateTrainingTypeModel(
        status: false,
        message: e.toString(),
      );
    }
  }

  Future<MemberUpdateTrainingTypeModel> deleteTrainingTypeMode(
    Map<String, dynamic> body,
  ) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteTrainingType}',
        body: body,
      );
      return MemberUpdateTrainingTypeModel.fromJson(res);
    } catch (e) {
      return MemberUpdateTrainingTypeModel(
        status: false,
        message: e.toString(),
      );
    }
  }
}
