import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/Cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomAppBar.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomTextField.dart';
import 'package:mynotes/screens/NotesView/widgets/EditNotesColorsList.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            CustomAppBar(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              title: "Edit Note",
              icon: Icons.check,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
                initialText: widget.note.title,
                hint: 'Title',
                onChanged: (value) {
                  title = value;
                }),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              initialText: widget.note.subTitle,
              onChanged: (value) {
                content = value;
              },
              hint: 'Content',
              maxLines: 6,
            ),
            const SizedBox(
              height: 40,
            ),
            EditNotesColorsList(noteModel: widget.note),
          ]),
        ),
      ),
    );
  }
}
