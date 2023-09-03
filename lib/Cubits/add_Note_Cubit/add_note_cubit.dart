import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/Note_Model.dart';
import 'package:noteapp/Views/constanats.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
Color? color= Colors.blue;
  addnote(NoteModel note) async {
    note.color=color!.value;
    emit(AddNoteLouding());
    try {
      var notebox = Hive.box<NoteModel>(kNotesBoxs);
      await notebox.add(note);
      emit(AddNotesucess());
    } catch (e) {
      emit(AddNotefailuer(e.toString()));
   
    }
  }
}
