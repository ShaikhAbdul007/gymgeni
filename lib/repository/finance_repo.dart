import 'package:gymgeni/module/finance/model/revenue_model.dart';
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
      return FinanceModel(status: false, message: e.toString());
    }
  }

  Future<FinanceModel> getPendingFinanceData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getPendingPayments}',
      );
      return FinanceModel.fromJson(res);
    } catch (e) {
      return FinanceModel(status: false, message: e.toString());
    }
  }

  Future<TodaySaleModel> getTodayFinanceData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getTodaySales}',
      );
      return TodaySaleModel.fromJson(res);
    } catch (e) {
      return TodaySaleModel(status: false, message: e.toString());
    }
  }

  Future<RevenueModel> getTodayRevenueData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.revenueToday}',
      );
      return RevenueModel.fromJson(res);
    } catch (e) {
      return RevenueModel(status: false, message: e.toString());
    }
  }

  Future<RevenueModel> getWeeklyRevenueData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.revenueWeekly}',
      );
      return RevenueModel.fromJson(res);
    } catch (e) {
      return RevenueModel(status: false, message: e.toString());
    }
  }

  Future<RevenueModel> getMonthlyRevenueData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.revenueMonthly}',
      );
      return RevenueModel.fromJson(res);
    } catch (e) {
      return RevenueModel(status: false, message: e.toString());
    }
  }

  Future<RevenueModel> getTotalRevenueData() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.revenueTotal}',
      );
      return RevenueModel.fromJson(res);
    } catch (e) {
      return RevenueModel(status: false, message: e.toString());
    }
  }
}
