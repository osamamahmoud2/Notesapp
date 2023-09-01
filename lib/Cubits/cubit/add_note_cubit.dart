import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/Note_Model.dart';
import 'package:noteapp/Views/Constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());


  addnote(NoteModel note)async{
   emit( AddNoteLouding());
    try {
      var Notebox = Hive.box<NoteModel>(kNotesBoxs);
       emit( AddNotesucess());
     await Notebox.add(note);
    } catch (e) {
    AddNotefailuer(e.toString());
    }
  }
}