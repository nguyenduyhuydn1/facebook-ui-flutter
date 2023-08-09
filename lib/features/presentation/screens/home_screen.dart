import 'package:flutter/material.dart';

import 'package:facebook_ui/config/constants/data.dart';
import 'package:facebook_ui/config/constants/constant.dart';

import 'package:facebook_ui/features/presentation/views/views.dart';
import 'package:facebook_ui/features/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(icon: Icons.search, size: 30, onPressed: () {}),
              CircleButton(icon: Icons.message, size: 30, onPressed: () {}),
            ],
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return const Column(children: [
              PostView(currentUser: currentUser),
              SizedBox(height: 10),
              RoomsView(users: onlineUsers),
              SizedBox(height: 10),
              StoryView()
            ]);
          }))
        ],
      ),
    );
  }
}

class StoryView extends StatelessWidget {
  const StoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
