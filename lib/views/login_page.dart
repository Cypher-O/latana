import 'package:flutter/material.dart';
import 'package:latana/viewmodel/login.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StackedView<LoginViewModel> {
  const LoginPage({super.key});

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back, ${viewModel.userName}!'),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'enter your password here',
                ),
              ),
              ElevatedButton(
                onPressed: viewModel.login,
                child: const Text('Log in'),
              ),
              // Add other widgets based on the second image
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}