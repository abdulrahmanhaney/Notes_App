import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        NotesView.id: (context) {
          return const NotesView();
        },
        EditNoteView.id: (context) {
          return const EditNoteView();
        }
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: kPrimaryColor,
      ),
      initialRoute: NotesView.id,
    );
  }
}
