import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymgeni/theme/theme.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  intailization();
  runApp(const MyApp());
}

intailization() async {
  await GetStorage.init();
  usePathUrlStrategy();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Gym Geni',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      routerDelegate: GetDelegate(backButtonPopMode: PopMode.History),
      routeInformationParser: GetInformationParser(
        initialRoute: AppRoutes.initial,
      ),
      getPages: AppRoutes.routes,
      defaultTransition: Transition.fadeIn,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Center(child: Text("404 - Page not found")),
      ),
    );
  }
}
