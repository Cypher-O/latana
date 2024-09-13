import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latana/models/challenge.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String get userName => 'Jones';
  int _selectedNavIndex = 0;
  int get selectedNavIndex => _selectedNavIndex;

  final List<bool> exerciseStates = [true, false, false, false, false];
  final List<String> exerciseLabels = [
    "Fast Fist",
    "Dumbbell",
    "Cable Bar",
    "Triceps",
    "Bench"
  ];

  void toggleExerciseState(int index) {
    for (int i = 0; i < exerciseStates.length; i++) {
      exerciseStates[i] = i == index;
    }
    notifyListeners();
  }

  void setSelectedNavIndex(int index) {
    _selectedNavIndex = index;
    notifyListeners();
  }

  List<Challenge> get challenges => [
        Challenge(
          name: 'SPRINT',
          description: 'Sprint to\nHealth',
          duration: 'Mar 12 - Mar 30',
          icon: SvgPicture.asset(
            'assets/images/vector-1.svg',
            width: 24,
            height: 24,
          ),
          color: Colors.amberAccent,
          gradientColors: [Colors.white, Colors.amber.shade50],
        ),
        Challenge(
          name: 'FASTING',
          description: '4 x 16h\nFasts',
          duration: 'Mar 12 - Mar 30',
          icon: SvgPicture.asset(
            'assets/images/vector-2.svg',
            width: 24,
            height: 24,
          ),
          color: Colors.blue,
          gradientColors: [Colors.white, Colors.blue.shade50],
        ),
        Challenge(
          name: 'LIFTING',
          description: 'Gain that\nMuscles',
          duration: 'Mar 12 - Mar 30',
          icon: SvgPicture.asset(
            'assets/images/vector-3.svg',
            width: 24,
            height: 24,
          ),
          color: Colors.purple,
          gradientColors: [Colors.white, Colors.purple.shade50],
        ),
      ];
}
