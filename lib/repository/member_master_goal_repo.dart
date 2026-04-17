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
      return MemberAddGoalModel(status: false, message: e.toString());
    }
  }

  Future<MemberAllGoalModel> getGoal() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getGoal}',
      );
      return MemberAllGoalModel.fromJson(res);
    } catch (e) {
      return MemberAllGoalModel(status: false, message: e.toString());
    }
  }

  Future<MemberUpdateGoalModel> updateGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateGoal}',
        body: body,
      );
      return MemberUpdateGoalModel.fromJson(res);
    } catch (e) {
      return MemberUpdateGoalModel(status: false, message: e.toString());
    }
  }

  Future<MemberUpdateGoalModel> deleteGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteGoal}',
        body: body,
      );
      return MemberUpdateGoalModel.fromJson(res);
    } catch (e) {
      return MemberUpdateGoalModel(status: false, message: e.toString());
    }
  }
}
