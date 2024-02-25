import 'package:flutter/material.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/widgets/AddNoteWidget.dart';

class EditNotesColorsList extends StatefulWidget {
  const EditNotesColorsList({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = const [
      Color(0xFF98ABEE),
      Color(0xFF750E21),
      Color(0xFFE3651D),
      Color(0xFFBED754),
      Colors.blue,
      Color(0xFF78A083),
      Color(0xFFED7D31),
    ];
    int currentIndex =
        colors.indexWhere((element) => element.value == widget.noteModel.color);

    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ColorItem(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                widget.noteModel.color = colors[index].value;
              },
              color: colors[index],
              isActive: index == currentIndex,
            );
          }),
    );
    ;
  }
}
