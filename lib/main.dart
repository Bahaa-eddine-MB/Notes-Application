import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mynotes/Cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/screens/NotesView/NotesView.dart';
import 'package:mynotes/simple_bloc_observer.dart';
import 'package:mynotes/theme/constans.dart';
    import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(Constans.kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNotesCubit(),
        ),
      ],
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
