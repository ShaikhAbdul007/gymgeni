import 'package:gymgeni/data/networking.dart';
import 'package:gymgeni/module/member/model/members_model.dart';

import '../data/apiendpoint.dart';

class MemberRepo {
  final networking = Networking();

  Future<MembersModel> getMemberData({required String memberStatus}) async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getMembers}$memberStatus',
      );
      return MembersModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
