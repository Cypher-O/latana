import 'package:flutter/material.dart';

class Challenge {
  final String name;
  final String description;
  final String duration;
  final dynamic icon;
  final Color color;
  final List<Color> gradientColors;

  Challenge({
    required this.name,
    required this.description,
    required this.duration,
    required this.icon,
    required this.color,
    required this.gradientColors,
  });
}
