import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class RoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuth = false; // ya fetch from SharedPreferences or any auth state
    if (!isAuth) {
      return const RouteSettings(name: '/login');
    }
  }
}
