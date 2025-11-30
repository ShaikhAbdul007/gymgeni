import 'package:gymgeni/module/employee/model/employee_attendance_model.dart';

import '../data/apiendpoint.dart';
import '../data/networking.dart';

class EmployeeAttendanceRepo {
  final networking = Networking();

  Future<EmployeeAttendanceModel> getEmployeeAttendance() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.employeeAttendance}',
      );
      return EmployeeAttendanceModel.fromJson(res);
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
