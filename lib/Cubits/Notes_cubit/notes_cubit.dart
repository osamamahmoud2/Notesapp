import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/Models/Note_Model.dart';

import '../../Views/constanats.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
List<NoteModel>? notes;

  fetchAllNotes()async{
    
    
      var notebox = Hive.box<NoteModel>(kNotesBoxs);
       notes =notebox.values.toList();
     emit(NotesSucess());
  }
}
 