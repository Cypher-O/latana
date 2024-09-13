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
              const SizedBox(height: 15),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
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
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.notifications_none, size: 28)),
          ],
        ),
      ],
    );
  }

  Widget _buildLearnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
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
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // Check if the label is empty to decide the shape
        shape: label.isEmpty ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: label.isEmpty ? null : BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: label.isEmpty
          ? SvgPicture.asset(
              assetPath,
              width: 24,
              height: 24,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  assetPath,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8), // Space between the icon and text
                Text(
                  label,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
    );
  }

  Widget _buildContinueLearning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Continue Learning',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),
        Container(
          height: 300,
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
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
      width: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: challenge.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          challenge.icon is IconData
              ? Icon(challenge.icon as IconData,
                  color: challenge.color, size: 24)
              : SizedBox(
                  width: 24, height: 24, child: challenge.icon as Widget),
          const SizedBox(height: 8),
          Text(challenge.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(challenge.description, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          Text(challenge.duration,
              style: TextStyle(fontSize: 10, color: Colors.grey[600])),
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
