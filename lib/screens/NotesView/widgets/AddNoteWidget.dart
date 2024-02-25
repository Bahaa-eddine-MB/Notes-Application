import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mynotes/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/widgets/ColorsListView.dart';
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
            height: 15,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final dateTime = DateTime.now();
                final formattedDateTime =
                    DateFormat.yMMMMEEEEd().format(dateTime);
                final noteModel = NoteModel(
                  title: title!,
                  subTitle: content!,
                  date: formattedDateTime,
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

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key,
      required this.color,
      required this.isActive,
      required this.onTap});
  final Color color;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: color,
              ),
            ),
        )
        : GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
        );
  }
}

