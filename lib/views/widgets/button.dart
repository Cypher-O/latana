import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latana/viewmodel/login.dart';

Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => viewModel.login(),
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

Widget buildFaceIdLogin(String assetPath) {
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
