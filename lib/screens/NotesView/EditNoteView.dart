import 'package:flutter/material.dart';
import 'package:mynotes/screens/NotesView/widgets/EditViewBody.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditViewBody(),
    );
  }
}