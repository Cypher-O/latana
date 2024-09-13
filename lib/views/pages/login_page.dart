import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latana/viewmodel/login.dart';
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
              _buildWelcomeText(viewModel),
              const SizedBox(height: 8),
              _buildInstructionText(),
              const SizedBox(height: 32),
              _buildPasswordText(viewModel),
              const SizedBox(height: 8),
              _buildPasswordField(viewModel),
              const SizedBox(height: 8),
              _buildForgotPasswordLink(),
              const SizedBox(height: 24),
              _buildLoginButton(context, viewModel),
              const SizedBox(height: 24),
              _buildFaceIdLogin('assets/images/faceid.svg'),
              const Spacer(),
              _buildSwitchAccountLink(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText(LoginViewModel viewModel) {
    return Text(
      'Welcome back,\n${viewModel.userName}!',
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
    );
  }

  Widget _buildInstructionText() {
    return const Text(
      'Enter your password to login to your account',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildPasswordText(LoginViewModel viewModel) {
    return const Text(
      'Password',
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
      ),
    );
  }

  Widget _buildPasswordField(LoginViewModel viewModel) {
    return TextField(
      obscureText: !viewModel.isPasswordVisible,
      decoration: InputDecoration(
        hintText: 'enter your password here',
        hintStyle: TextStyle(color: Colors.grey[400]),
        suffixIcon: IconButton(
          icon: Icon(
            viewModel.isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: const Color(0xFF272d3b),
          ),
          onPressed: viewModel.togglePasswordVisibility,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: BorderSide.none,
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Colors.black), // Outline color of black
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Colors.black), // Outline color of black
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Colors.black), // Outline color of black
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => viewModel.login(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF272d3b),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Log in',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFaceIdLogin(String assetPath) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: TextButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            assetPath,
            width: 24,
            height: 24,
          ),
          label: const Text(
            'Login with Face ID',
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey[100],
            padding: const EdgeInsets.symmetric(vertical: 16), // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchAccountLink(LoginViewModel viewModel) {
    return Center(
      child: TextButton(
        onPressed: viewModel.switchAccount,
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: 'Not ${viewModel.userName}? ',
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const TextSpan(
                text: 'Switch Account',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
