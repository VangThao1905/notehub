import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notehub_app/domain/notes/note_model.dart';
import 'package:notehub_app/presentation/home_page.dart';
import 'package:notehub_app/presentation/notes/note_item_view.dart';
import 'package:notehub_app/presentation/notes/note_modify_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<NoteModel> notes = [
    NoteModel(
      id: 0,
      title: 'Go shopping',
      content: 'I will go shopping at 6 pm',
      createAt: DateTime.now().toString(),
      tag: 'Shopping',
    ),
    NoteModel(
      id: 1,
      title: 'Learning english',
      content: 'I will learning english on Monday',
      createAt: DateTime.now().toString(),
      tag: 'Learning',
    ),
    NoteModel(
      id: 3,
      title: 'Go fishing',
      content: 'I will go out and fishing',
      createAt: DateTime.now().toString(),
      tag: 'Entertainment',
    ),
    NoteModel(
      id: 4,
      title: 'Test ne',
      content: 'This is test',
      createAt: DateTime.now().toString(),
      tag: 'Test',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {
              NoteModifyPage.show(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return NoteItemView(note: notes[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 8);
          },
          itemCount: notes.length,
        ),
      ),
    );
  }
}
