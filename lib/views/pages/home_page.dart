import 'package:flutter/material.dart';
import 'package:latana/viewmodel/home.dart';
import 'package:latana/views/widgets/challenges_section.dart';
import 'package:latana/views/widgets/continue_learning.dart';
import 'package:latana/views/widgets/floating_bottom_navbar.dart';
import 'package:latana/views/widgets/header.dart';
import 'package:latana/views/widgets/learn_section.dart';
import 'package:stacked/stacked.dart';

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
                        buildHeader(viewModel),
                        const SizedBox(height: 20),
                        buildLearnSection(viewModel),
                        const SizedBox(height: 15),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        buildContinueLearning(),
                        const SizedBox(height: 20),
                        buildChallenges(viewModel),
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

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
