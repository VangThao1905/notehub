import 'package:flutter/material.dart';
import 'package:notehub_app/core/assets_path.dart';
import 'package:notehub_app/domain/notes/note_model.dart';

class NoteItemView extends StatelessWidget {
  NoteItemView({super.key, required this.note});

  NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(AssetsPath.imgNoteHub, width: 76, height: 76),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    note.content,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green,
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Text(
                      note.tag,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 3, child: Text(note.createAt)),
          ],
        ),
      ),
    );
  }
}
