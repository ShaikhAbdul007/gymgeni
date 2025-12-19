import 'package:gymgeni/module/dashboard/model/expiry_member_model.dart';
import '../data/apiendpoint.dart';
import '../data/networking.dart';

class ExpiryMemberRepo {
  final networking = Networking();

  Future<ExpiryMemberModel> getExpiryMembers() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.expiryMembersData}',
      );
      return ExpiryMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
