import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/data/networking.dart';

import '../module/login/model/login_model.dart';

class LoginRepo {
  final networking = Networking();

  Future<LoginModel> login(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.loginEndPoint}',
        body: body,
      );
      var response = LoginModel.fromJson(res);
      return response;
    } catch (e) {
      return throw (e);
    }
  }
}
