import 'package:flutter/material.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/widgets/EditViewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditViewBody(note:note),
    );
  }
}