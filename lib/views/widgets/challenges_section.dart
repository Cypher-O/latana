import 'package:flutter/material.dart';
import 'package:latana/models/challenge.dart';
import 'package:latana/viewmodel/home.dart';

Widget buildChallenges(HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Try a Challenge',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            Text(
              'View all',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: viewModel.challenges
                .map((challenge) => buildChallengeCard(challenge))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildChallengeCard(Challenge challenge) {
    return Container(
      width: 140,
      height: 170,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: challenge.gradientColors,
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: challenge.icon is IconData
                  ? Icon(
                      challenge.icon as IconData,
                      color: challenge.color,
                      size: 24,
                    )
                  : challenge.icon as Widget,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            challenge.name.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: challenge.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            challenge.description,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            challenge.duration,
            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
