import 'package:flutter/material.dart';
import 'package:noteapp/Models/Note_Model.dart';

import 'Widgets/Edit_View_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.notee});
final NoteModel notee;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditViewBody(notee: notee,),
    );
  }
}
