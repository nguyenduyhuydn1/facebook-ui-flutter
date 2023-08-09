import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: size, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
