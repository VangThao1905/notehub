import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notehub_app/domain/auth/my_user_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isShowLoading,
    @Default(MyUserModel()) MyUserModel myUser,
  }) = _ProfileState;
}
