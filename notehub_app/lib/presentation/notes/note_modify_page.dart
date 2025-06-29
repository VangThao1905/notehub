import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notehub_app/application/note_modify/note_modify_cubit.dart';
import 'package:notehub_app/application/note_modify/note_modify_state.dart';
import 'package:notehub_app/domain/notes/note_model.dart';

class NoteModifyPage extends StatefulWidget {
  const NoteModifyPage({super.key});

  static dynamic show(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteModifyPage()),
    );
  }

  @override
  State<NoteModifyPage> createState() => _NoteModifyPageState();
}

class _NoteModifyPageState extends State<NoteModifyPage> {
  final TextEditingController _noteTitleTEC = TextEditingController();
  final TextEditingController _noteContentTEC = TextEditingController();
  final FocusNode _noteTitleNode = FocusNode();
  final FocusNode _noteContentNode = FocusNode();

  final NoteModifyCubit _noteModifyCubit = GetIt.I.get<NoteModifyCubit>();

  @override
  void initState() {
    _noteModifyCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add note'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<NoteModifyCubit, NoteModifyState>(
          bloc: _noteModifyCubit,
          listener: (context, state) {
            if (state.isShowLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
            }
          },
          listenWhen: (pre, curr) => true,
          buildWhen: (pre, curr) => true,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    children: [
                      if (state.imagePath.isNotEmpty) ...{
                        Image.file(
                          File(state.imagePath),
                          width: 120,
                          height: 120,
                        ),
                      },

                      IconButton(
                        onPressed: () async {
                          XFile pickedImage = await pickImage();
                          _noteModifyCubit.updatePickedImage(pickedImage.path);
                        },
                        icon: Icon(Icons.add_a_photo, size: 24),
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
                      value: state.selectedTag,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (String? value) {
                        if (value != null) {
                          _noteModifyCubit.updateSelectedTag(value);
                        }
                      },
                      items:
                          state.tags.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Center(
                  child: FilledButton(
                    onPressed: () async {
                      int id = UniqueKey().hashCode;
                      String title = _noteTitleTEC.text.trim();
                      String content = _noteContentTEC.text.trim();
                      NoteModel note = NoteModel(
                        id: id,
                        title: title,
                        content: content,
                        createAt: DateTime.now().toUtc().toString(),
                        tag: state.selectedTag,
                      );

                      bool isAddNoteSucces = await _noteModifyCubit.addNote(
                        note: note,
                        image: File(state.imagePath),
                      );

                      if (isAddNoteSucces) {
                        // Navigator.of(context).pop();
                        EasyLoading.showSuccess('Add note success');
                      } else {
                        EasyLoading.showSuccess('Add note failure');
                      }
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
