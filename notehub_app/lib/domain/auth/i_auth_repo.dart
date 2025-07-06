import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:notehub_app/domain/auth/my_user_model.dart';

abstract class IAuthRepo {
  Future<Option<String>> signUp({
    required String email,
    required String password,
  });

  Future<Option<String>> signIn({
    required String email,
    required String password,
  });

  Future<bool> updateUser({required MyUserModel user, required File? image});

  Future<MyUserModel> getMyUser();
}
