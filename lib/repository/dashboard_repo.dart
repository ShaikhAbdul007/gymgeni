import 'package:gymgeni/module/dashboard/model/dashboard_business_overall_componenet_model.dart';

import '../data/apiendpoint.dart';
import '../data/networking.dart';

class DashboardRepo {
  final networking = Networking();

  Future<DashboardModel> getDashboardStats() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.dashboardStats}',
      );
      return DashboardModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
