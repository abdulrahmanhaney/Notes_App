import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomNotesButtonCheet extends StatelessWidget {
  const CustomNotesButtonCheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CustomTextField(
              maxLines: 1,
              hint: 'Note Title',
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              maxLines: 7,
              hint: 'Note Content',
            ),
            SizedBox(
              height: 100,
            ),
            CustomButton()
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
