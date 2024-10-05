import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

class DisplayNoteBody extends StatelessWidget {
  const DisplayNoteBody({super.key, required this.note});

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          CustomAppBar(
            header: note.title,
            icon: Icons.edit,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return EditNoteView(note: note);
              }));
            },
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListView(children: [Text(note.subtitle)]),
          ))
        ],
      ),
    );
  }
}
