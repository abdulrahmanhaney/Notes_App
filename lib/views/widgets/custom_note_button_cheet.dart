import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomNotesButtonCheet extends StatelessWidget {
  const CustomNotesButtonCheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              maxLines: 1,
              hint: 'Note Title',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              maxLines: 7,
              hint: 'Note Content',
            ),
            const SizedBox(
              height: 100,
            ),
            const CustomButton()
          ],
        ),
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
