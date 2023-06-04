import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../constants.dart';
import 'color_item.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late String? content, title;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        children: [
          CustomAppBar(
            icon: Icons.check,
            title: 'Edit Note',
            onTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).getNotes();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Note Done...')));
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Note Title',
                  maxLines: 1,
                  intitial: widget.note.title,
                  onChange: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Note content',
                  maxLines: 7,
                  intitial: widget.note.content,
                  onChange: (value) {
                    content = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorsListForEdit(
                  note: widget.note,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorsListForEdit extends StatefulWidget {
  const ColorsListForEdit({super.key, required this.note});
  final NoteModel note;
  @override
  State<ColorsListForEdit> createState() => _ColorsListForEditState();
}

class _ColorsListForEditState extends State<ColorsListForEdit> {
  late int curruntIndex;

  @override
  void initState() {
    curruntIndex = kcolorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              curruntIndex = index;
              setState(() {});
              widget.note.color = kcolorsList[index].value;
            },
            child: ColorItem(
              color: kcolorsList[index],
              isActive: index == curruntIndex ? true : false,
            ),
          ),
        ),
        itemCount: kcolorsList.length,
      ),
    );
  }
}
