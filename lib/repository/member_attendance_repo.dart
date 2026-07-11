import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/member/model/member_attandence_model.dart';

class MemberAttendanceRepo {
  final networking = Networking();

  Future<MemberAttendanceModel> getMemberAttendance() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.memberAttendance}',
      );
      return MemberAttendanceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<dynamic> checkInMember(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.memberAttendanceCheckIn}',
        body: body,
      );
      return res;
    } catch (e) {
      return throw (e);
    }
  }

  Future<dynamic> checkOutMember(Map<String, dynamic> body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.memberAttendanceCheckOut}',
        body: body,
      );
      return res;
    } catch (e) {
      return throw (e);
    }
  }
}
