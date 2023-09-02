part of 'notes_cubit.dart';

@immutable 
sealed class NotesState {}

final class NotesInitial extends NotesState {}
final class NotesLouding extends NotesState {}
final class NotesSucess extends NotesState {
  final List<NoteModel> notes;

  NotesSucess(this.notes);
}
final class Notesfailure extends NotesState {

  final String errmessage;

  Notesfailure(this.errmessage);
}

