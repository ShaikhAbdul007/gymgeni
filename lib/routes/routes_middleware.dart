import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import 'package:gymgeni/routes/routes_path.dart';

class RoutesMiddleware extends GetMiddleware with CacheManager {
  @override
  RouteSettings? redirect(String? route) {
    final String token = retriveToken();
    final bool isAuth = token.isNotEmpty;
    final String currentRoute = route ?? '';
    final bool isAuthPage =
        currentRoute == RoutesPaths.loginView ||
        currentRoute == RoutesPaths.signUpView;

    // Unauthenticated users can only visit login/signup pages.
    if (!isAuth && !isAuthPage) {
      return const RouteSettings(name: RoutesPaths.loginView);
    }

    // Authenticated users should not go back to login/signup pages.
    if (isAuth && isAuthPage) {
      return const RouteSettings(name: RoutesPaths.dashboardView);
    }
    return null;
  }
}
