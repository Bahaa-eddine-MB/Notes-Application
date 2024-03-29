import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/Conts/constans.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(Constans.kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  fetchNotesByTitle(String title) {
    var notesBox = Hive.box<NoteModel>(Constans.kNotesBox);
    notes = notesBox.values
        .where((note) => note.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
    emit(NotesSuccess());
  }
}
