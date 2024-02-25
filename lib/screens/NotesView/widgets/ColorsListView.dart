import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:mynotes/screens/NotesView/widgets/AddNoteWidget.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xFF98ABEE),
    Color(0xFF750E21),
    Color(0xFFE3651D),
    Color(0xFFBED754),
    Colors.blue,
    Color(0xFF78A083),
    Color(0xFFED7D31),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ColorItem(
              onTap: (){
                setState(() {
                  currentIndex = index;
                });
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              },
              color: colors[index],
              isActive: index == currentIndex,
            );
          }),
    );
  }

}
