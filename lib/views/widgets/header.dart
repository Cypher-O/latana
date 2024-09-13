import 'package:flutter/material.dart';
import 'package:latana/viewmodel/home.dart';

Widget buildHeader(HomeViewModel viewModel) {
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