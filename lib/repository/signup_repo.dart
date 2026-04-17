import 'dart:io';
import 'dart:typed_data';

import 'package:gymgeni/data/apiendpoint.dart';
import 'package:gymgeni/module/signups/model/signup_model.dart';
import 'package:gymgeni/utils/constant.dart';
import '../data/networking.dart';

class SignupRepo {
  final network = Networking();

  Future<SignupModel> signUpFun({
    required Map<String, String> body,
    File? file,
    Uint8List? fileBytes,
    String? fileField,
    String? fileName,
  }) async {
    try {
      var res = await network.postMultipartRequestData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.registerEndPoint}',
        body: body,
        file: file ?? File(''),
        fileBytes: fileBytes ?? Uint8List(0),
        fileField: fileField ?? '',
        fileName: fileName ?? '',
      );
      var singUpRes = SignupModel.fromJson(res);
      Constant.customPrintLog(singUpRes);
      return singUpRes;
    } catch (e) {
      return SignupModel(status: false, message: e.toString());
    }
  }
}
