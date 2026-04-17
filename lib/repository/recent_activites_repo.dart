import 'package:gymgeni/module/dashboard/model/recent_acitivity_model.dart';
import '../data/apiendpoint.dart';
import '../data/networking.dart';

class RecentActivitiesRepo {
  final networking = Networking();

  Future<RecentActivityModel> getRecentActivities() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.recentActivities}',
      );
      return RecentActivityModel.fromJson(res);
    } catch (e) {
      return RecentActivityModel(status: false, message: e.toString());
    }
  }
}
