import 'package:flutter/material.dart';
import 'package:flutter_notes/model/note_model.dart';
import 'package:flutter_notes/screens/view_note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.noteDeleted, required this.index});

  final Note note;
  final int index;
  final Function(int) noteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute
          (builder: (context)=> NoteView(note:note,index:index,noteDeleted: noteDeleted,)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 10,),
              Text(
                note.body,
                style: const TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
