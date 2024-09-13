import 'package:flutter/material.dart';
import 'package:latana/viewmodel/home.dart';
import 'package:latana/views/widgets/exercise_icon_row.dart';

Widget buildLearnSection(HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        Text(
          'Watch and learn how to use',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(viewModel.exerciseStates.length, (index) {
            final isActive = viewModel.exerciseStates[index];
            final label = isActive ? viewModel.exerciseLabels[index] : '';
            return buildExerciseIcon(
                index,
                'assets/images/exercise_icon-${index + 1}.svg',
                label,
                isActive,
                viewModel);
          }),
        ),
      ],
    );
  }
  