import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 15,
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
