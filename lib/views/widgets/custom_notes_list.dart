import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/all_notes/all_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesCubit, AllNotesState>(
      builder: (context, state) {
        List<NotesModel> notes =
            BlocProvider.of<AllNotesCubit>(context).notesList ?? [];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: notes.isEmpty
              ? const Center(
                  child: Text("No Notes Yet !"),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: NoteItemWidget(
                        notelist: notes[index],
                      ),
                    );
                  }),
        );
      },
    );
  }
}
