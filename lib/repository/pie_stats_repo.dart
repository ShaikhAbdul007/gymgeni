import 'package:gymgeni/module/dashboard/model/pie_stats_model.dart';
import '../data/apiendpoint.dart';
import '../data/networking.dart';

class PieStatsRepo {
  final networking = Networking();

  Future<PieStatsModel> getPieStats() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.pieDaigram}',
      );
      return PieStatsModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
