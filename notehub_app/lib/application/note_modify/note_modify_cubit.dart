import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/application/note_modify/note_modify_state.dart';
import 'package:notehub_app/domain/notes/i_note_repo.dart';
import 'package:notehub_app/domain/notes/note_model.dart';

@injectable
class NoteModifyCubit extends Cubit<NoteModifyState> {
  NoteModifyCubit(this._iNoteRepo) : super(NoteModifyState());

  final INoteRepo _iNoteRepo;

  void init() {
    List<String> tags = ['Shopping', 'Learning', 'Entertainment', 'Test'];
    emit(state.copyWith(tags: tags, selectedTag: tags.first));
  }

  void updatePickedImage(String path) {
    emit(state.copyWith(imagePath: path));
  }

  void updateSelectedTag(String tag) {
    emit(state.copyWith(selectedTag: tag));
  }

  Future<bool> addNote({required NoteModel note, required File image}) async {
    log('addNote:$note, imagePath:${image.path}');
    emit(state.copyWith(isShowLoading: true));
    final result = await _iNoteRepo.addNote(note: note, image: image);
    emit(state.copyWith(isShowLoading: false));
    return result;
  }

  Future<bool> updateNote({
    required NoteModel note,
    required File? image,
  }) async {
    log('updateNote:$note, imagePath:${image?.path}');
    emit(state.copyWith(isShowLoading: true));
    final result = await _iNoteRepo.updateNote(note: note, image: image);
    emit(state.copyWith(isShowLoading: false));
    return result;
  }

  Future<bool> deleteNote(int noteId) async {
    log('deleteNote:$noteId');
    emit(state.copyWith(isShowLoading: true));
    final result = await _iNoteRepo.deleteNote(id: noteId);
    emit(state.copyWith(isShowLoading: false));
    return result;
  }
}
