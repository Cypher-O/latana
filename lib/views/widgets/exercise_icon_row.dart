import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latana/viewmodel/home.dart';

Widget buildExerciseIcon(int index, String assetPath, String label,
      bool isActive, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.toggleExerciseState(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: isActive ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isActive ? BorderRadius.circular(24) : null,
          color: Colors.white,
        ),
        child: isActive
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    assetPath,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              )
            : SvgPicture.asset(
                assetPath,
                width: 24,
                height: 24,
              ),
      ),
    );
  }