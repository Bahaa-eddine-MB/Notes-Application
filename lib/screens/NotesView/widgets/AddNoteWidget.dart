import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomButton.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomTextField.dart';

class AddNoteWidget extends StatefulWidget {
  const AddNoteWidget({super.key});

  @override
  State<AddNoteWidget> createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends State<AddNoteWidget> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? content;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            hint: "Write yout note",
            maxLines: 5,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final noteModel = NoteModel(
                  title: title!,
                  subTitle: content!,
                  date: DateTime.now().toString(),
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
