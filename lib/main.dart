import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mynotes/Cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/NotesView.dart';
import 'package:mynotes/simple_bloc_observer.dart';
import 'package:mynotes/Conts/constans.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(Constans.kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubitCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes app',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
            brightness: Brightness.dark),
        home: const NotesView(),
      ),
    );
  }
}
