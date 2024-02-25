import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/Cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/widgets/NoteCard.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<NotesCubitCubit, NotesCubitState>(
        builder: (context, state) {
      List<NoteModel> notes =
          BlocProvider.of<NotesCubitCubit>(context).notes ?? [];
      if (notes.isEmpty) {
        return const Center(child: Text("You have currently 0 notes"));
      }
      return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: NoteCard(note: note),
            );
          });
    }));
  }
}
