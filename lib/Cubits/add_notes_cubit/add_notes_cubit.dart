import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mynotes/Models/note_model.dart';
import 'package:mynotes/theme/constans.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
 
  addNote(NoteModel noteModel) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(Constans.kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
