import 'package:flutter/material.dart';

class CustomNotesButtonCheet extends StatelessWidget {
  const CustomNotesButtonCheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              border: buildBorder(),
              hintText: 'Note Title',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            maxLines: 7,
            decoration: InputDecoration(
              border: buildBorder(),
              hintText: 'Note Content',
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );
  }
}
