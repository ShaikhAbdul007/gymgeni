import 'package:gymgeni/data/networking.dart';

import '../data/apiendpoint.dart';
import '../module/employee_master/employee_master_type/model/employee_type_model.dart';
import '../module/employee_master/employee_master_type/model/employee_type_update_model.dart';

class EmployeeMasterEmployeeTypeRepo {
  final networking = Networking();

  Future<EmployeeTypeModel> getEmployeeType() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getEmployeeType}',
      );
      return EmployeeTypeModel.fromJson(res);
    } catch (e) {
      return EmployeeTypeModel(status: false, message: e.toString());
    }
  }

  Future<EmployeeTypeUpdateModel> addEmployeeType(dynamic body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createEmployeeType}',
        body: body,
      );
      return EmployeeTypeUpdateModel.fromJson(res);
    } catch (e) {
      return EmployeeTypeUpdateModel(status: false, message: e.toString());
    }
  }

  Future<EmployeeTypeUpdateModel> updateEmployeeType(dynamic body) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updateEmployeeType}',
        body: body,
      );
      return EmployeeTypeUpdateModel.fromJson(res);
    } catch (e) {
      return EmployeeTypeUpdateModel(status: false, message: e.toString());
    }
  }

  Future<EmployeeTypeUpdateModel> deleteEmployeeType(dynamic body) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteEmployeeType}',
        body: body,
      );
      return EmployeeTypeUpdateModel.fromJson(res);
    } catch (e) {
      return EmployeeTypeUpdateModel(status: false, message: e.toString());
    }
  }
}
