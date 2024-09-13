import 'package:latana/app/app.locator.dart';
import 'package:latana/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String get userName => 'Owolu';
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void login() {
    _navigationService.navigateTo(Routes.homePage);
  }

  void switchAccount() {}
}
