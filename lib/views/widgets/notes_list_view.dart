import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_notes_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  List<NoteModel> notesList = [];
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        notesList = BlocProvider.of<NotesCubit>(context).notesList ?? [];
        return ListView.builder(
          itemCount: notesList.length,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
            return CustomNoteItem(
              note: notesList[index],
            );
          },
        );
      },
    );
  }
}
