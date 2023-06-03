import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'colors_listview.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            maxLines: 1,
            hint: 'Note Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            maxLines: 7,
            hint: 'Note Content',
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const ColorsList(),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  var noteModel = NoteModel(
                    color: Colors.green.value,
                    date: DateTime.now().toString(),
                    title: title!,
                    content: subtitle!,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
