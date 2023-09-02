part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}
final class AddNoteLouding extends AddNoteState {}
final class AddNotesucess extends AddNoteState {}
final class AddNotefailuer extends AddNoteState {
  final String errmassge;

  AddNotefailuer(this.errmassge);
}

