import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/domain/auth/i_auth_repo.dart';
import 'package:notehub_app/domain/notes/i_note_repo.dart';
import 'package:notehub_app/domain/notes/note_model.dart';

@Injectable(as: INoteRepo)
class NoteRepoImpl implements INoteRepo {
  @override
  Future<List<NoteModel>> getNotes() async {
    List<NoteModel> notes = [];
    try {
      await FirebaseFirestore.instance.collection('NOTES').get().then((
        querySnapshot,
      ) {
        for (var query in querySnapshot.docs) {
          notes.add(NoteModel.fromJson(query.data()));
        }
      });
      return notes;
    } catch (e) {
      log('getNotes error:${e.toString()}');
      return [];
    }
  }

  @override
  Future<bool> addNote({required NoteModel note, required File image}) async {
    log('addNote repo');
    try {
      /// Add image to store
      final storageRef = FirebaseStorage.instance.ref();
      var snapshot = await storageRef
          .child('notes_images/${note.id}.jpg')
          .putFile(image);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      log('downloadUrl:$downloadUrl');

      note = note.copyWith(image: downloadUrl);

      /// Add note to cloud fire store
      await FirebaseFirestore.instance
          .collection('NOTES')
          .doc(note.id.toString())
          .set(note.toJson())
          .then((value) {
            return Future.value(true);
          });
    } catch (e) {
      log('addNote error:${e.toString()}');
      return Future.value(false);
    }
    return Future.value(false);
  }

  @override
  Future<bool> deleteNote({required int id}) async {
    log('deleteNote repo');
    try {
      /// Delete image from storage
      final storageRef = FirebaseStorage.instance.ref();
      await storageRef.child('notes_images/$id.jpg').delete();

      /// Add note to cloud fire store
      await FirebaseFirestore.instance
          .collection('NOTES')
          .doc(id.toString())
          .delete();
      return Future.value(true);
    } catch (e) {
      log('deleteNote error:${e.toString()}');
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateNote({
    required NoteModel note,
    required File? image,
  }) async {
    log('updateNote repo');
    if (image != null) {
      try {
        /// Add image to store
        final storageRef = FirebaseStorage.instance.ref();
        var snapshot = await storageRef
            .child('notes_images/${note.id}.jpg')
            .putFile(image);

        String downloadUrl = await snapshot.ref.getDownloadURL();

        log('downloadUrl:$downloadUrl');

        note = note.copyWith(image: downloadUrl);

        /// Add note to cloud fire store
        await FirebaseFirestore.instance
            .collection('NOTES')
            .doc(note.id.toString())
            .update(note.toJson())
            .then((value) {
              return Future.value(true);
            });
      } catch (e) {
        log('updateNote error:${e.toString()}');
        return Future.value(false);
      }
      return Future.value(false);
    } else {
      try {
        /// Add note to cloud fire store
        FirebaseFirestore.instance
            .collection('NOTES')
            .doc(note.id.toString())
            .update(note.toJson())
            .then((value) {
              return Future.value(true);
            });
      } catch (e) {
        log('updateNote error:${e.toString()}');
        return Future.value(false);
      }
      return Future.value(false);
    }
  }
}
