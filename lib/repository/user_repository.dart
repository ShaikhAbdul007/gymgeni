import 'package:gymgeni/data/networking.dart';
import 'package:gymgeni/module/user/model/user_model.dart';

import '../data/apiendpoint.dart';

class UserRepository {
  final networking = Networking();

  Future<UserDataModel> getUserData({required dynamic body}) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.userData}',
        body: body,
      );
      var response = UserDataModel.fromJson(res);
      return response;
    } catch (e) {
      return UserDataModel(status: false, message: e.toString());
    }
  }
}
