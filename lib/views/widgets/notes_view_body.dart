import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        children: [
          CustomAppBar(
            icon: Icons.search,
            title: 'Notes',
            onTap: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          const Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
