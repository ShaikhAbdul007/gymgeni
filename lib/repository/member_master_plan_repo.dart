import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';

import '../module/member_master/member_plan/model/member_addplan_model.dart';
import '../module/member_master/member_plan/model/member_allplan_model.dart';
import '../module/member_master/member_plan/model/member_update_model.dart';

class PlanRepo {
  final networking = Networking();

  Future<MemberAddPlanModel> addNewPlan(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createPlan}',
        body: body,
      );
      return MemberAddPlanModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllPlanModel> getPlan() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getPlan}',
      );
      return MemberAllPlanModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdatePlanModel> updatePlan(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updatePlan}',
        body: body,
      );
      return MemberUpdatePlanModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdatePlanModel> deletePlan(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deletePlan}',
        body: body,
      );
      return MemberUpdatePlanModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
