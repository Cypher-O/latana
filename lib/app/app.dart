import 'package:latana/views/home_page.dart';
import 'package:latana/views/login_page.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: LoginPage),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
