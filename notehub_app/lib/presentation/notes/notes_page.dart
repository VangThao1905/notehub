import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notehub_app/domain/notes/note_model.dart';
import 'package:notehub_app/presentation/notes/note_item_view.dart';

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
              showAddNoteBottomSheet();
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

  void showAddNoteBottomSheet() {
    final TextEditingController _noteTitleTEC = TextEditingController();
    final TextEditingController _noteContentTEC = TextEditingController();
    final FocusNode _noteTitleNode = FocusNode();
    final FocusNode _noteContentNode = FocusNode();

    const List<String> list = <String>[
      'Shopping',
      'Learning',
      'Entertainment',
      'Test',
    ];
    String dropdownValue = list.first;

    XFile? _image;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add note'),
              SizedBox(height: 12),

              Center(
                child: Row(
                  children: [
                    if (_image != null && _image!.path.isNotEmpty) ...{
                      Image.file(File(_image!.path), width: 76, height: 76),
                    },

                    IconButton(
                      onPressed: () async {
                        setState(() async {
                          XFile pickedImage = await pickImage();
                          log('Image picked path:${pickedImage.path}');
                          _image = pickedImage;
                        });
                      },
                      icon: Icon(Icons.broken_image_outlined, size: 48),
                    ),
                  ],
                ),
              ),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: _noteTitleTEC,
                focusNode: _noteTitleNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Content',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                controller: _noteContentTEC,
                focusNode: _noteContentNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text('Tags: '),
                  SizedBox(width: 8),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items:
                        list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Center(child: FilledButton(onPressed: () {}, child: Text('Add'))),
            ],
          ),
        );
      },
    );
  }

  Future<XFile> pickImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      return result;
    }
    return XFile('');
  }
}
