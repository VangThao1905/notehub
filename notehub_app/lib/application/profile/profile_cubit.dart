import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/application/profile/profile_state.dart';
import 'package:notehub_app/domain/auth/i_auth_repo.dart';
import 'package:notehub_app/domain/auth/my_user_model.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> init() async {
    emit(state.copyWith(isShowLoading: true));
    MyUserModel myUserModel = await GetIt.I.get<IAuthRepo>().getMyUser();
    emit(state.copyWith(myUser: myUserModel, isShowLoading: false));
  }

  Future<bool> updateUser({
    required MyUserModel myUser,
    required File? image,
  }) async {
    log('updateUser:$myUser, imagePath:${image?.path}');
    emit(state.copyWith(isShowLoading: true));
    final result = await GetIt.I.get<IAuthRepo>().updateUser(
      user: myUser,
      image: image,
    );
    emit(state.copyWith(isShowLoading: false));
    return result;
  }
}
