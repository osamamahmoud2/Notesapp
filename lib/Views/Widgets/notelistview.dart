import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/Notes_cubit/notes_cubit.dart';
import 'package:noteapp/Models/Note_Model.dart';

import 'noteitem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(

      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ?? [];  // if note model is empty it will dis play empty screen 
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
       itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: ((context, index) {
              return  Padding(
                padding:const  EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(
                  notes:  notes[index],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
