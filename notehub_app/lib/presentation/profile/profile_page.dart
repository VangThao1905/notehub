import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notehub_app/application/profile/profile_cubit.dart';
import 'package:notehub_app/application/profile/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileCubit _profileCubit = GetIt.I.get<ProfileCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _profileCubit.init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            bloc: _profileCubit,
            listener: (context, state) {
              if (state.isShowLoading) {
                EasyLoading.show();
              } else {
                EasyLoading.dismiss();
              }
            },
            buildWhen: (pre, curr) => true,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(
                          state.myUser.avatar.isNotEmpty
                              ? state.myUser.avatar
                              : 'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?semt=ais_hybrid&w=740',
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          XFile _file = await pickImage();

                          if (_file.path.isNotEmpty) {
                            bool isUpdateUserSuccess = await _profileCubit
                                .updateUser(
                                  myUser: state.myUser,
                                  image: File(_file.path),
                                );

                            log('isUpdateUserSuccess:${isUpdateUserSuccess}');

                            if (isUpdateUserSuccess) {
                              await _profileCubit.init();
                            } else {
                              EasyLoading.showError('Update avatar failure');
                            }
                          }
                        },
                        icon: Icon(Icons.camera_alt_outlined),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text('Email: ${FirebaseAuth.instance.currentUser?.email}'),
                  SizedBox(height: 8),
                  Text('Username: ${state.myUser.username}'),
                  SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Text('Logout'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<XFile> pickImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      return result;
    }
    return XFile('');
  }
}
