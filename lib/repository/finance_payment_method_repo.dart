import 'package:gymgeni/module/finance_master/finance_payment_method/model/all_payment_method_model.dart';

import '../data/apiendpoint.dart';
import '../data/networking.dart';
import '../module/finance_master/finance_payment_method/model/add_update_payment_method_model.dart';

class FinancePaymentMethodRepo {
  final networking = Networking();

  Future<AllPaymentModel> getFinancePaymentMethod() async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getPaymentModes}',
      );
      return AllPaymentModel.fromJson(res);
    } catch (e) {
      return AllPaymentModel(status: false, message: e.toString());
    }
  }

  Future<AddUpdatePaymentModel> addFinancePaymentMethod(dynamic body) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createPaymentModes}',
        body: body,
      );
      return AddUpdatePaymentModel.fromJson(res);
    } catch (e) {
      return AddUpdatePaymentModel(status: false, message: e.toString());
    }
  }

  Future<AddUpdatePaymentModel> updateFinancePaymentMethod(dynamic body) async {
    try {
      var res = await networking.putData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.updatePaymentModes}',
        body: body,
      );
      return AddUpdatePaymentModel.fromJson(res);
    } catch (e) {
      return AddUpdatePaymentModel(status: false, message: e.toString());
    }
  }

  Future<AddUpdatePaymentModel> deleteFinancePaymentMethod(dynamic body) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deletePaymentModes}',
        body: body,
      );
      return AddUpdatePaymentModel.fromJson(res);
    } catch (e) {
      return AddUpdatePaymentModel(status: false, message: e.toString());
    }
  }
}
