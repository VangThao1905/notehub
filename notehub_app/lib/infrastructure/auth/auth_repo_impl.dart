import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:notehub_app/domain/auth/i_auth_repo.dart';
import 'package:notehub_app/domain/auth/my_user_model.dart';

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
        /// Luu thong tin User len DB
        MyUserModel myUser = MyUserModel(
          id: credential.user!.uid,
          email: credential.user?.email ?? '',
          username: credential.user?.email?.split('@').first ?? '',
          avatar: '',
        );
        await FirebaseFirestore.instance
            .collection('USERS')
            .doc(myUser.id)
            .set(myUser.toJson())
            .then((value) {
              return none();
            });
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

  @override
  Future<bool> updateUser({
    required MyUserModel user,
    required File? image,
  }) async {
    log('updateUser repo');
    if (image != null) {
      try {
        /// Add image to store
        final storageRef = FirebaseStorage.instance.ref();
        var snapshot = await storageRef
            .child('profile_images/${user.id}.jpg')
            .putFile(image);

        String downloadUrl = await snapshot.ref.getDownloadURL();

        log('downloadUrl:$downloadUrl');

        user = user.copyWith(avatar: downloadUrl);

        /// Add note to cloud fire store
        await FirebaseFirestore.instance
            .collection('USERS')
            .doc(user.id.toString())
            .update(user.toJson())
            .then((value) {
              return Future.value(true);
            });
        return Future.value(true);
      } catch (e) {
        log('updateUser error:${e.toString()}');
        return Future.value(false);
      }
      return Future.value(false);
    } else {
      try {
        /// Add note to cloud fire store
        FirebaseFirestore.instance
            .collection('USERS')
            .doc(user.id.toString())
            .update(user.toJson())
            .then((value) {
              return Future.value(true);
            });
      } catch (e) {
        log('updateUser error:${e.toString()}');
        return Future.value(false);
      }
      return Future.value(false);
    }
  }

  @override
  Future<MyUserModel> getMyUser() async {
    MyUserModel myUserModel = MyUserModel();
    try {
      await FirebaseFirestore.instance.collection('USERS').get().then((
        querySnapshot,
      ) {
        for (var query in querySnapshot.docs) {
          MyUserModel userModel = MyUserModel.fromJson(query.data());
          if (userModel.id == FirebaseAuth.instance.currentUser?.uid) {
            myUserModel = userModel;
          }
        }
      });
      return myUserModel;
    } catch (e) {
      log('getMyUser error:${e.toString()}');
      return MyUserModel();
    }
  }
}
