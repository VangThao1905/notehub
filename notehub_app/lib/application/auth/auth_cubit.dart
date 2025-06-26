import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/application/auth/auth_state.dart';
import 'package:notehub_app/domain/auth/i_auth_repo.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isShowLoading: true));
    final result = await GetIt.I.get<IAuthRepo>().signUp(
      email: email,
      password: password,
    );
    emit(state.copyWith(isShowLoading: false));
    return result.fold(
      () {
        return '';
      },
      (errorMessage) {
        return errorMessage;
      },
    );
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isShowLoading: true));
    final result = await GetIt.I.get<IAuthRepo>().signIn(
      email: email,
      password: password,
    );
    emit(state.copyWith(isShowLoading: false));
    return result.fold(
      () {
        return '';
      },
      (errorMessage) {
        return errorMessage;
      },
    );
  }
}
