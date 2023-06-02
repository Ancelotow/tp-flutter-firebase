import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? textColor;
  final int? size;

  const MyIconButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.textColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
            size: size?.toDouble(),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: size?.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
