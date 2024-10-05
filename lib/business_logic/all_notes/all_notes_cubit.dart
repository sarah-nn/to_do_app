import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constant/app_constatnt.dart';
import 'package:notes_app/models/note_model.dart';

part 'all_notes_state.dart';

class AllNotesCubit extends Cubit<AllNotesState> {
  AllNotesCubit() : super(AllNotesInitial());

  List<NotesModel>? notesList;
  getAllNotes() {
    var noteBox = Hive.box<NotesModel>(kNoteBox);
    notesList = noteBox.values.toList();
    emit(AllNotesSuccess());
  }
}
