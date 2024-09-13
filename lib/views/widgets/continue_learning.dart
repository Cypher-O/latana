import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildContinueLearning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Continue Learning',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/workout.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer translucent circle
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  // Inner red circle with play icon (bottom layer)
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 52,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Track SVG aligned inside the translucent circle towards the left (top layer)
                  Positioned(
                    left: -5,
                    top: 20,
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: SvgPicture.asset(
                        'assets/images/track.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }