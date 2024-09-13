import 'package:flutter/material.dart';
import 'package:latana/models/challenge.dart';
import 'package:latana/viewmodel/home.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StackedView<HomeViewModel> {
  const HomePage({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(viewModel),
              const SizedBox(height: 20),
              _buildLearnSection(),
              const SizedBox(height: 20),
              _buildContinueLearning(),
              const SizedBox(height: 20),
              _buildChallenges(viewModel),
              const Spacer(),
              _buildBottomNavBar(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good afternoon,',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              viewModel.userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Icon(Icons.notifications_none, size: 28),
          ],
        ),
      ],
    );
  }

  Widget _buildLearnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Watch and learn how to use',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildExerciseIcon(
                'assets/images/exercise_icon-1.svg', 'Fast Fist'),
            _buildExerciseIcon('assets/images/exercise_icon-2.svg', ''),
            _buildExerciseIcon('assets/images/exercise_icon-3.svg', ''),
            _buildExerciseIcon('assets/images/exercise_icon-4.svg', ''),
            _buildExerciseIcon('assets/images/exercise_icon-5.svg', ''),
          ],
        ),
      ],
    );
  }

  Widget _buildExerciseIcon(String assetPath, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          // child: Icon(icon, size: 24),
          child: SvgPicture.asset(
            assetPath,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildContinueLearning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Continue Learning',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/workout.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildChallenges(HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Try a Challenge',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'View all',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: viewModel.challenges
              .map((challenge) => _buildChallengeCard(challenge))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildChallengeCard(Challenge challenge) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: challenge.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(challenge.icon, color: challenge.color),
          const SizedBox(height: 5),
          Text(challenge.name,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(challenge.description, style: const TextStyle(fontSize: 12)),
          Text(challenge.duration,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavBarItem(Icons.local_fire_department, 'Workout', true),
        _buildNavBarItem(Icons.play_circle_outline, 'Watch', false),
        _buildNavBarItem(Icons.list_alt, 'Programs', false),
        _buildNavBarItem(Icons.bar_chart, 'Activity', false),
      ],
    );
  }

  Widget _buildNavBarItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.red : Colors.grey),
        Text(label,
            style: TextStyle(color: isActive ? Colors.red : Colors.grey)),
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
