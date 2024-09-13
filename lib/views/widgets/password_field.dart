  import 'package:flutter/material.dart';
import 'package:latana/viewmodel/login.dart';

Widget buildPasswordField(LoginViewModel viewModel) {
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