import 'package:flutter/material.dart';
import 'package:noteapp/Views/Widgets/customsearchicon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {super.key, required this.titel, required this.icon, this.onPressedd});
  final String titel;
  final IconData icon;
  final void Function()? onPressedd;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomSearchIcon(
          onPressedd: onPressedd,
          icon: icon,
        )
      ],
    );
  }
}
