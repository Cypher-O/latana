import 'package:flutter/material.dart';
import 'package:latana/viewmodel/login.dart';
import 'package:latana/views/widgets/button.dart';
import 'package:latana/views/widgets/custom_text.dart';
import 'package:latana/views/widgets/password_field.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StackedView<LoginViewModel> {
  const LoginPage({super.key});

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // _buildWelcomeText(viewModel),
              CustomText(
                'Welcome back,\n${viewModel.userName}!',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              const SizedBox(height: 8),
              const CustomText(
                'Enter your password to login to your account',
                fontSize: 16,
                color: Colors.grey,
              ),
              const SizedBox(height: 32),
              const CustomText('Password', fontSize: 15),
              const SizedBox(height: 8),
              buildPasswordField(viewModel),
              const SizedBox(height: 8),
              buildForgotPasswordLink(),
              const SizedBox(height: 24),
              buildLoginButton(context, viewModel),
              const SizedBox(height: 24),
              buildFaceIdLogin('assets/images/faceid.svg'),
              const Spacer(),
              buildSwitchAccountLink(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
