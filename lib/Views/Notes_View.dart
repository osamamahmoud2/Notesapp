import 'package:flutter/material.dart';

import 'Widgets/Add_Note_Bottom_Sheet.dart';
import 'Widgets/Notes_View_Body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context, builder: (context){
          return const AddNoteBottomSheet();
        });

      },child:const  Icon(Icons.add),),
      body:const NotesViewBody(),
    );
  }
}
