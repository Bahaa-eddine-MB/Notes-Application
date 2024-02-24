import 'package:flutter/material.dart';
import 'package:mynotes/theme/constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      required this.onSaved});
  final String hint;
  final int maxLines;
  final Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return 'Please enter some text';
        }
        return null;
      
      },
      onSaved: onSaved,
      maxLines: maxLines,
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
