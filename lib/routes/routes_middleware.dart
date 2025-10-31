import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';

class RoutesMiddleware extends GetMiddleware with CacheManager {
  @override
  RouteSettings? redirect(String? route) {
    String token = retriveToken();
    final bool isAuth = token.isNotEmpty ? true : false;
    if (!isAuth) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
