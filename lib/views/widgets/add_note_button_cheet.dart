import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class CustomNotesButtonCheet extends StatelessWidget {
  const CustomNotesButtonCheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSucsess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add Note Done With Success...')));
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).getNotes();
          } else if (state is AddNoteFailuer) {
            debugPrint('Failed To Add Note : ${state.errorMessae}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
