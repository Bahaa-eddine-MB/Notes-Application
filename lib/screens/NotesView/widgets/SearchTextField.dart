import 'package:flutter/material.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomSearchIcon.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomTextField.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.onTap, required this.onChanged});
  final Function() onTap;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          child: CustomTextField(
            onChanged: onChanged,
            hint: "Search for a note ..",
            isSearch: true,
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        CustomSearchIcon(
          icon: Icons.close,
          onTap: onTap,
        )
      ],
    );
  }
}
