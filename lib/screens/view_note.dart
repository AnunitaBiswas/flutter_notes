
import 'package:flutter/material.dart';
import 'package:flutter_notes/model/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.index, required this.noteDeleted});

  final Note note;
  final int index;
  final Function(int) noteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Note"),
        actions: [
          IconButton(onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: const Text("Delete This ?"),
                    content: Text("Note ${note.title} will be deleted!"),
                    actions: [
                       TextButton(onPressed: (){
                         Navigator.of(context).pop();
                         noteDeleted(index);
                         Navigator.of(context).pop();
                       },
                      child: const Text("Delete"),
                      ),
                       TextButton(onPressed: (){
                         Navigator.of(context).pop();
                       },
                        child: const Text("Cancel"),
                      )
                    ],
                  );
                });
          }, icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            note.title,
            style: TextStyle(
                fontSize: 24),
            ),
            const SizedBox(height: 10,),
            Text(
              note.body,
              style: TextStyle(
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
