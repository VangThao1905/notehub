import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user_model.freezed.dart';

part 'my_user_model.g.dart';

@freezed
class MyUserModel with _$MyUserModel {
  const factory MyUserModel({
    @Default('') String id,
    @Default('') String email,
    @Default('') String username,
    @Default('') String avatar,
  }) = _MyUserModel;

  factory MyUserModel.fromJson(Map<String, dynamic> json) =>
      _$MyUserModelFromJson(json);
}
