import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/all_notes/all_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/display_notes.dart';

class NoteItemWidget extends StatefulWidget {
  const NoteItemWidget({super.key, required this.notelist});

  final NotesModel notelist;

  @override
  State<NoteItemWidget> createState() => _NoteItemWidgetState();
}

class _NoteItemWidgetState extends State<NoteItemWidget> {
  String get truncatedText {
    final words = widget.notelist.subtitle.split(' ');
    if (words.length <= 15) {
      return widget.notelist.subtitle;
    } else {
      return words.sublist(0, 15).join(' ') + '  .....  ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DisplayNotesView(notesModel: widget.notelist);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Color(widget.notelist.color)),
        padding: const EdgeInsets.only(top: 5, bottom: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                widget.notelist.title,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    widget.notelist.delete();
                    BlocProvider.of<AllNotesCubit>(context).getAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                truncatedText,
                style: const TextStyle(color: Colors.black45, height: 1.4),
              ),
            ),
            const SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.notelist.date,
                  style: const TextStyle(color: Colors.black45, fontSize: 12.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
