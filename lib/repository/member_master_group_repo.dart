import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';

import '../module/member_master/member_group/model/member_addgroup_model.dart';
import '../module/member_master/member_group/model/member_allgroup_model.dart';
import '../module/member_master/member_group/model/member_update_model.dart';

class GroupRepo {
  final networking = Networking();

  Future<MemberAddGroupModel> addNewGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createGroup}',
        body: body,
      );
      return MemberAddGroupModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberAllGroupModel> getGroup() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getGroup}',
      );
      return MemberAllGroupModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdateGroupModel> updateGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateGroup}',
        body: body,
      );
      return MemberUpdateGroupModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<MemberUpdateGroupModel> deleteGroup(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteGroup}',
        body: body,
      );
      return MemberUpdateGroupModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
