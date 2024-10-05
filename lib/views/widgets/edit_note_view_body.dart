import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/all_notes/all_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NotesModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<AllNotesCubit>(context).getAllNotes();
                Navigator.pop(context);
              },
              header: "Edit Notes",
              icon: Icons.check,
            ),
            const SizedBox(height: 19),
            CustomTextField(
              hint: "Title",
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 19),
            CustomTextField(
              onChanged: (value) {
                subtitle = value;
              },
              hint: "Content",
              maxLine: 7,
            ),
            const SizedBox(height: 19),
            EditColorsList(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}
