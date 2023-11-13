import 'package:flutter/material.dart';
import 'package:flutter_notes/model/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.createNote});

  final Function(Note) createNote;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextFormField(
            controller: titleController,
            style: const TextStyle(
              fontSize: 28
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Title"
            ),
          ),
          const SizedBox(height: 6,),
          TextFormField(
            controller: bodyController,
            style: const TextStyle(
                fontSize: 20
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Description"
            ),
          ),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(titleController.text.isEmpty) {
            return ;
          }
          if(bodyController.text.isEmpty) {
                return;
          }
          final note= Note(title: titleController.text, body: bodyController.text);
          widget.createNote(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
