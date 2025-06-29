import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'note_modify_state.freezed.dart';

@freezed
class NoteModifyState with _$NoteModifyState {
  const factory NoteModifyState({
    @Default(false) bool isShowLoading,
    @Default('') String imagePath,
    @Default([]) List<String> tags,
    @Default('') String selectedTag,
  }) = _NoteModifyState;
}
