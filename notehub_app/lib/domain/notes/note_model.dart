import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';

part 'note_model.g.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String content,
    @Default('') String image,
    @Default('') String createAt,
    @Default('') String updateAt,
    @Default('') String tag,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
