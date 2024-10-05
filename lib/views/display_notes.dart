import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/display_note_body.dart';

class DisplayNotesView extends StatelessWidget {
  const DisplayNotesView({super.key, required this.notesModel});

  final NotesModel notesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DisplayNoteBody(
      note: notesModel,
    ));
  }
}
