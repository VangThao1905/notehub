import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notehub_app/domain/notes/note_model.dart';

part 'note_state.freezed.dart';

@freezed
class NoteState with _$NoteState {
  const factory NoteState({
    @Default(false) bool isShowLoading,
    @Default([]) List<NoteModel> notes,
}) = _NoteState;

}
