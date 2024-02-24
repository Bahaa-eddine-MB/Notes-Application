import 'package:flutter/material.dart';
import 'package:mynotes/screens/NotesView/widgets/NoteCard.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: NoteCard(),
        ),
      ),
    );
  }
}
