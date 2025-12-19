import 'dart:io';
import 'dart:typed_data';

import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/employee/model/all_employee_model.dart';
import '../module/employee/model/create_new_employee_model.dart';
import '../utils/constant.dart';

class EmployeeRepo {
  final networking = Networking();

  Future<AllEmployeeModel> getEmployee() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getEmployee}',
      );
      return AllEmployeeModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreatNewEmployeeModel> signUpFun({
    required Map<String, String> body,
    File? file,
    Uint8List? fileBytes,
    String? fileField,
    String? fileName,
  }) async {
    try {
      var res = await networking.postMultipartRequestData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createEmployee}',
        body: body,
        file: file ?? File(''),
        fileBytes: fileBytes ?? Uint8List(0),
        fileField: fileField ?? '',
        fileName: fileName ?? '',
      );
      var ress = CreatNewEmployeeModel.fromJson(res);
      Constant.customPrintLog(ress);
      return ress;
    } catch (e) {
      return throw (e);
    }
  }

  // Future<AllEmployeeModel> createEmployee(dynamic body) async {
  //   try {
  //     var res = await networking.postData(
  //       url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createEmployee}',
  //       body: body,
  //     );
  //     return AllEmployeeModel.fromJson(res);
  //   } catch (e) {
  //     return throw (e);
  //   }
  // }

  // Future<> updateEmployee(dynamic body) async {
  //   try {
  //     var res = await networking.putData(
  //       url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateEmployee}',
  //       body: body,
  //     );
  //     return AllEmployeeModel.fromJson(res);
  //   } catch (e) {
  //     return throw (e);
  //   }
  // }

  // Future<> deletemployee(dynamic body) async {
  //   try {
  //     var res = await networking.deleteData(
  //       url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteEmployee}',
  //       body: body,
  //     );
  //     return AllEmployeeModel.fromJson(res);
  //   } catch (e) {
  //     return throw (e);
  //   }
  // }
}
