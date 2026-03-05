import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE53935), // Emergency Red
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Theme.of(context).cardColor,
            size: 16,
          ),
          SizedBox(width: 8),
          Text(
            'EMERGENCIAS 24/7: Llámanos al 555-0123',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w900,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
