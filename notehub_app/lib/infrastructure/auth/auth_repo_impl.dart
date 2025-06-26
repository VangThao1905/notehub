import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/domain/auth/i_auth_repo.dart';

@Injectable(as: IAuthRepo)
class AuthRepoImpl implements IAuthRepo {
  @override
  Future<Option<String>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return none();
      }
      return some('Something went wrong');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return some('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return some('The account already exists for that email.');
      }
      return some('Something went wrong');
    } catch (e) {
      return some('Something went wrong');
    }
  }

  @override
  Future<Option<String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return none();
      }
      return some('Something went wrong');
    } on FirebaseAuthException catch (e) {
      log('signIn error:${e.toString()}');
      if (e.code == 'user-not-found') {
        return some('User not found');
      } else if (e.code == 'wrong-password') {
        return some('wrong-password');
      }
      return some('Something went wrong');
    }
  }
}
