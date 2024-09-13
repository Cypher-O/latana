import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latana/models/challenge.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String get userName => 'Jones';

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
          color: Colors.yellow,
          gradientColors: [Colors.yellow.shade100, Colors.yellow.shade200],
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
          gradientColors: [Colors.blue.shade100, Colors.blue.shade200],
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
          gradientColors: [Colors.purple.shade100, Colors.purple.shade200],
        ),
      ];
}
