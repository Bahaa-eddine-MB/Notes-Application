import 'package:flutter/material.dart';
import 'package:mynotes/theme/constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.initialText,
      this.onChanged});
  final String hint;
  final int maxLines;
  final String? initialText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      initialValue: initialText,
      cursorColor: Constans.kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(color: Colors.white),
        enabledBorder: buildBorder(color: Colors.white),
        focusedBorder: buildBorder(color: Constans.kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color, width: 1.5),
    );
  }
}
