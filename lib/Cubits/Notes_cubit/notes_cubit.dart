import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/Note_Model.dart';

import '../../Views/Constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());


  fetchAllNotes()async{
    
    try {
      var notebox = Hive.box<NoteModel>(kNotesBoxs);
      List<NoteModel> notes =notebox.values.toList();
      emit(NotesSucess(notes ));
    } catch (e) {
      emit(Notesfailure(e.toString()));
  }
}}
 