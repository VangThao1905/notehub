import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/application/note/note_state.dart';
import 'package:notehub_app/domain/notes/i_note_repo.dart';
import 'package:notehub_app/domain/notes/note_model.dart';

@injectable
class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState());

  Future<void> init() async {
    log('init note');
    emit(state.copyWith(isShowLoading: true));
    List<NoteModel> notes = await GetIt.I.get<INoteRepo>().getNotes();

    emit(state.copyWith(notes: notes, isShowLoading: false));
  }
}
