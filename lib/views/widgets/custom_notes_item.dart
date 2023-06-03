import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.id, arguments: note);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        height: 190,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (note.title.length > 15)
                        ? '${note.title.substring(1, 15)}...'
                        : note.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    (note.content.length > 45)
                        ? '${note.content.substring(1, 45)}...'
                        : note.content,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    note.delete();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Delete Note Done With Success...')));
                    BlocProvider.of<NotesCubit>(context).getNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
                Text(
                  DateFormat.yMMMEd().format(DateTime.parse(note.date)),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
