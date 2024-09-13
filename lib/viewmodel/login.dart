import 'package:flutter/material.dart';
import 'package:latana/views/pages/home_page.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();

  String get userName => 'Owolu';
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void switchAccount() {
    // Implement account switching logic
    // For example:
    // _navigationService.replaceWith(Routes.accountSelectionView);
  }
}
