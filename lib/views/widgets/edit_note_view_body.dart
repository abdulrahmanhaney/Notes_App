import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20),
      child: Column(
        children: [
          CustomAppBar(
            icon: Icons.check,
            title: 'Edit Note',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(hint: 'Note Title', maxLines: 1),
          SizedBox(
            height: 15,
          ),
          CustomTextField(hint: 'Note content', maxLines: 7),
        ],
      ),
    );
  }
}
