import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/Cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomAppBar.dart';
import 'package:mynotes/screens/NotesView/widgets/NotesListView.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          const CustomAppBar(title: "Notes", icon: Icons.search),
          const SizedBox(
            height: 4,
          ),
          const NotesListView(),
        ],
      ),
    );
  }
}
