import 'package:flutter/material.dart';

class Custom_Search_Icon extends StatelessWidget {
  const Custom_Search_Icon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16)),
      child:  Icon(
        icon,
        size: 26,
      ),
    );
  }
}
