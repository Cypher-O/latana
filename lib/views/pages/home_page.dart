import 'package:flutter/material.dart';
import 'package:latana/models/challenge.dart';
import 'package:latana/viewmodel/home.dart';
import 'package:latana/views/widgets/floating_bottom_navbar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StackedView<HomeViewModel> {
  const HomePage({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(viewModel),
                        const SizedBox(height: 20),
                        _buildLearnSection(),
                        const SizedBox(height: 15),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        _buildContinueLearning(),
                        const SizedBox(height: 20),
                        _buildChallenges(viewModel),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          FloatingBottomNavBar(
            selectedIndex: viewModel.selectedNavIndex,
            onItemSelected: viewModel.setSelectedNavIndex,
          ),
        ],
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
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
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

  Widget _buildChallenges(HomeViewModel viewModel) {
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
                .map((challenge) => _buildChallengeCard(challenge))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildChallengeCard(Challenge challenge) {
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

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
