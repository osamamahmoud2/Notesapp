import 'package:flutter/material.dart';
import 'package:noteapp/Views/Widgets/Custom_Search_Icon.dart';

class Custom_App_bar extends StatelessWidget {
  const Custom_App_bar({super.key, required this.titel, required this.icon});
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
        Custom_Search_Icon(icon: icon,)

      ],
    );
  }
}
