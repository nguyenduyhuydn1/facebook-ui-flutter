import 'package:flutter/material.dart';

import 'package:facebook_ui/config/constants/constant.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String image;
  final bool isActive;

  const CustomCircleAvatar({
    super.key,
    required this.image,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[200],
        backgroundImage: NetworkImage(image),
      ),
      isActive
          ? Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Palette.online,
                    border: Border.all(width: 2, color: Colors.white)),
              ),
            )
          : const SizedBox.shrink()
    ]);
  }
}
