import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';
import '../module/member_master/member_goal/model/member_addgoal_model.dart';
import '../module/member_master/member_goal/model/member_allgoal_model.dart';
import '../module/member_master/member_goal/model/member_update_model.dart';

class GoalRepo {
  final networking = Networking();

  Future<MemberAddGoalModel> addNewGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createGoal}',
        body: body,
      );
      return MemberAddGoalModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllGoalModel> getGoal() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getGoal}',
      );
      return MemberAllGoalModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdateGoalModel> updateGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateGoal}',
        body: body,
      );
      return MemberUpdateGoalModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdateGoalModel> deleteGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteGoal}',
        body: body,
      );
      return MemberUpdateGoalModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
