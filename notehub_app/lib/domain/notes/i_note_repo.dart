import 'dart:io';

import 'package:notehub_app/domain/notes/note_model.dart';

abstract class INoteRepo {
  Future<bool> addNote({required NoteModel note, required File image});

  Future<bool> updateNote({required NoteModel note, required File? image});

  Future<bool> deleteNote({required int id});
}
