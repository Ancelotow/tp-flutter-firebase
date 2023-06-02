import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const LabelButton({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
