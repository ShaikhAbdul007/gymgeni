import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'routes/routes.dart';
import 'routes/routes_path.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Gym Geni',
      debugShowCheckedModeBanner: false,
      routerDelegate: GetDelegate(backButtonPopMode: PopMode.History),
      routeInformationParser: GetInformationParser(
        initialRoute: RoutesPaths.mainScreen,
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
