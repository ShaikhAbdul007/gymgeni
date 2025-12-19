import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/finance/model/finance_pending_model.dart';
import '../module/finance/model/finance_today_model.dart';

class FinanceRepo {
  final networking = Networking();

  Future<FinanceModel> getFinanceData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getAllPayments}',
      );
      return FinanceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<FinanceModel> getPendingFinanceData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getPendingPayments}',
      );
      return FinanceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<TodayFinanceModel> getTodayFinanceData({
    required String dateee,
  }) async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getTodaySales}$dateee',
      );
      return TodayFinanceModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
