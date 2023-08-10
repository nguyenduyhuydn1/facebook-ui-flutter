import 'package:flutter/material.dart';

import 'package:facebook_ui/config/constants/constant.dart';
import 'package:facebook_ui/features/models/models.dart';

import 'package:facebook_ui/features/presentation/widgets/circle_button.dart';
import 'package:facebook_ui/features/presentation/widgets/custom_circle_avatar.dart';

class StoriesView extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const StoriesView({super.key, required this.user, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        itemCount: stories.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _StoryCard(user: user, isAddStory: true, story: null);
          }

          final story = stories[index - 1];

          return _StoryCard(story: story, user: null);
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User? user;
  final Story? story;
  final bool isAddStory;
  const _StoryCard(
      {required this.user, this.isAddStory = false, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            width: 110,
            height: double.infinity,
            placeholder: const AssetImage('assets/1.gif'),
            image: isAddStory
                ? NetworkImage(user!.imageUrl)
                : NetworkImage(story!.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleButton(
                        icon: Icons.add, size: 20, onPressed: () {}))
                : CustomCircleAvatar(image: story!.user.imageUrl)),
        Positioned(
            bottom: 8,
            right: 8,
            left: 8,
            child: isAddStory
                ? const Text("Add Story",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15))
                : Text(story!.user.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15))),
      ]),
    );
  }
}
