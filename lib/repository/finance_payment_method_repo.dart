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
      return throw (e);
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
      return throw (e);
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
      return throw (e);
    }
  }

  Future<AddUpdatePaymentModel> deletFinancePaymentMethod(dynamic body) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deletePaymentModes}',
        body: body,
      );
      return AddUpdatePaymentModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}
