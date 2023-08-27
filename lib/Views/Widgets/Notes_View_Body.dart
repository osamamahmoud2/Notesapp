import 'package:flutter/material.dart';
import 'package:noteapp/Views/Widgets/Custom_App_bar.dart';

import 'Note_List_View.dart';


class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Custom_App_bar(Titel: 'Notes',icon: Icons.search,),
          
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
 