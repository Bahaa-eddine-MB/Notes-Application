import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mynotes/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:mynotes/Cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:mynotes/screens/NotesView/widgets/AddNoteWidget.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 24,
                      left: 24,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const SingleChildScrollView(child: AddNoteWidget()),
                )),
          );
        },
      ),
    );
  }
}
