import 'package:flutter/material.dart';

import 'package:facebook_ui/features/models/models.dart';
import 'package:facebook_ui/features/presentation/widgets/widgets.dart';

class RoomsView extends StatelessWidget {
  final List<User> users;

  const RoomsView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        scrollDirection: Axis.horizontal,
        itemCount: users.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return const _RoomButton();

          final user = users[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: CustomCircleAvatar(image: user.imageUrl, isActive: true),
            ),
          );
        },
      ),
    );
  }
}

class _RoomButton extends StatelessWidget {
  const _RoomButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: BorderSide(width: 3, color: Colors.blueAccent[200]!)),
      icon: const Icon(Icons.video_call),
      label: const Text("Create Room"),
      onPressed: () {},
    );
  }
}
