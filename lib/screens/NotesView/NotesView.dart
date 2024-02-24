import 'package:flutter/material.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomFloatingButton.dart';
import 'package:mynotes/screens/NotesView/widgets/NoteViewBody.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: NoteViewBody(),
    );
  }
}
