import 'package:flutter/material.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomAppBar.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomTextField.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key});

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
      child: Form(
        key: formKey,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          const CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
              hint: 'Title',
              onSaved: (value) {
                title = value;
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            hint: 'Content',
            maxLines: 6,
          ),
        ]),
      ),
    );
  }
}
