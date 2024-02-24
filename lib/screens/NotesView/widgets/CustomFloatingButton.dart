import 'package:flutter/material.dart';
import 'package:mynotes/screens/NotesView/widgets/CustomBottomSheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      backgroundColor: Colors.greenAccent,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const CustomBottomSheet();
            });
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
