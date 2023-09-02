import 'package:flutter/material.dart';
import 'package:noteapp/Views/Widgets/Custom_Search_Icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.titel, required this.icon});
  final String titel;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          titel,
          style: const TextStyle(fontSize: 28),
        ),
       const  Spacer(),
        CustomSearchIcon(icon: icon,)

      ],
    );
  }
}
