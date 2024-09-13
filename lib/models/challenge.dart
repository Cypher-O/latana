import 'package:flutter/material.dart';

class Challenge {
  final String name;
  final String description;
  final String duration;
  final IconData icon;
  final Color color;

  Challenge({
    required this.name,
    required this.description,
    required this.duration,
    required this.icon,
    required this.color,
  });
}
