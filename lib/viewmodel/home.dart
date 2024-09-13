import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latana/models/challenge.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String get userName => 'Jones';

  List<Challenge> get challenges => [
        Challenge(
          name: 'SPRINT',
          description: 'Sprint to Health',
          duration: 'Mar 12 - Mar 30',
          icon: SvgPicture.asset(
            'assets/images/vector-1.svg',
            width: 24,
            height: 24,
          ),
          color: Colors.yellow,
        ),
        Challenge(
          name: 'FASTING',
          description: '4 x 16h Fasts',
          duration: 'Mar 12 - Mar 30',
          icon: SvgPicture.asset(
            'assets/images/vector-2.svg',
            width: 24,
            height: 24,
          ),
          color: Colors.blue,
        ),
        Challenge(
          name: 'LIFTING',
          description: 'Gain that Muscles',
          duration: 'Mar 12 - Mar 30',
          icon: SvgPicture.asset(
            'assets/images/vector-3.svg',
            width: 24,
            height: 24,
          ),
          color: Colors.purple,
        ),
      ];
}
