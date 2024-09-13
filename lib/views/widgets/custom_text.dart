import 'package:flutter/material.dart';
import 'package:latana/viewmodel/login.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? height;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}

Widget buildForgotPasswordLink() {
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

Widget buildSwitchAccountLink(LoginViewModel viewModel) {
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
