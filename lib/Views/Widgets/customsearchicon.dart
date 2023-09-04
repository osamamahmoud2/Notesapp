import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.onPressedd});
  final IconData icon;
  final void Function()? onPressedd;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16)),
        child: IconButton(
          onPressed: onPressedd,
          icon: Icon(
            icon,
            size: 26,
          ),
        ));
  }
}
