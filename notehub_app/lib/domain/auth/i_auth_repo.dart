import 'package:dartz/dartz.dart';

abstract class IAuthRepo {
  Future<Option<String>> signUp({
    required String email,
    required String password,
  });

  Future<Option<String>> signIn({
    required String email,
    required String password,
  });
}
