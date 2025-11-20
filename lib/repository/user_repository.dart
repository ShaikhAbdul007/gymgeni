import 'package:gymgeni/data/networking.dart';
import 'package:gymgeni/module/user/model/user_model.dart';

import '../data/apiendpoint.dart';

class UserRepository {
  final networking = Networking();

  Future<UserDataModel> getUserData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.userData}',
      );
      var response = UserDataModel.fromJson(res);
      return response;
    } catch (e) {
      return throw (e);
    }
  }
}
