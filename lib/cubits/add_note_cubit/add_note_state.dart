part of 'add_note_cubit.dart';


abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucsess extends AddNoteState {}

class AddNoteFailuer extends AddNoteState {
  final String errorMessae;
  AddNoteFailuer({required this.errorMessae});
}
