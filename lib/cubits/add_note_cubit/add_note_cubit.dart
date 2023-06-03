import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import '../../models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color currentcolor = kcolorsList[0];

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    note.color = currentcolor.value;
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSucsess());
    } catch (e) {
      emit(AddNoteFailuer(errorMessae: e.toString()));
    }
  }
}
