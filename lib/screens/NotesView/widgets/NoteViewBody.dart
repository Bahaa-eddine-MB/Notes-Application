import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/Cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomAppBar.dart';
import 'package:mynotes/screens/NotesView/widgets/NotesListView.dart';
import 'package:mynotes/screens/NotesView/widgets/SearchTextField.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          showSearch
              ? SearchTextField(
                  onChanged: (value) {
                    BlocProvider.of<NotesCubitCubit>(context)
                        .fetchNotesByTitle(value!);
                  },
                  onTap: () {
                    setState(() {
                      showSearch = false;
                    });
                    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                  },
                )
              : CustomAppBar(
                  title: "Notes",
                  icon: Icons.search,
                  onTap: () {
                    setState(() {
                      showSearch = true;
                    });
                  },
                ),
          const SizedBox(
            height: 4,
          ),
          const NotesListView(),
        ],
      ),
    );
  }
}
