import 'package:facebook_ui/features/presentation/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui/features/models/models.dart';

class PostView extends StatelessWidget {
  final User currentUser;
  const PostView({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            CustomCircleAvatar(image: currentUser.imageUrl),
            // CircleAvatar(
            //   radius: 20,
            //   backgroundColor: Colors.grey[200],
            //   backgroundImage: NetworkImage(currentUser.imageUrl),
            // ),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'what\'s on your mind')),
            )
          ]),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.live_tv_sharp),
                  label: const Text("Live")),
              const VerticalDivider(),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.live_tv_sharp),
                  label: const Text("Live")),
              const VerticalDivider(),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.live_tv_sharp),
                  label: const Text("Live")),
            ],
          )
        ],
      ),
    );
  }
}
