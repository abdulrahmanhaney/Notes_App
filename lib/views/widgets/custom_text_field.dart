import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.maxLines,
    this.onSaved,
    this.intitial,
    this.onChange
  });

  final String hint;
  final int maxLines;
  final String? intitial;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return '$hint Is Reqired';
        } else {
          return null;
        }
      },
      initialValue: intitial,
      minLines: maxLines,
      onChanged: onChange,
      maxLines: 1000000000000,
      style: const TextStyle(color: kPrimaryColor),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
