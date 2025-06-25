import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:notehub_app/application/auth/auth_cubit.dart';
import 'package:notehub_app/application/auth/auth_state.dart';
import 'package:notehub_app/core/extensions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController =
      TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _reEnterPasswordNode = FocusNode();

  final AuthCubit _authCubit = GetIt.I.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Sign up'), leading: BackButton()),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            bloc: _authCubit,
            listener: (context, state) {
              if (state.isShowLoading) {
                EasyLoading.show();
              } else {
                EasyLoading.dismiss();
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register an account for you',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 14),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _emailController,
                    focusNode: _emailNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else if (!value.isValidEmail()) {
                        return 'Email invalid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _passwordController,
                    focusNode: _passwordNode,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Re Enter Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    controller: _reEnterPasswordController,
                    focusNode: _reEnterPasswordNode,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  FilledButton(
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();
                      String reEnterPassword =
                          _reEnterPasswordController.text.trim();

                      if (email.isNotEmpty &&
                          password.isNotEmpty &&
                          reEnterPassword.isNotEmpty) {
                        if (password == reEnterPassword) {
                          /// Sign up
                          String signUpMessage = await _authCubit.signUp(
                            email: email,
                            password: password,
                          );

                          if (signUpMessage.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sign up success')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(signUpMessage)),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please check your re-enter password',
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all field')),
                        );
                      }
                    },
                    child: Text('Sign up'),
                  ),
                  SizedBox(height: 14),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'I have account? Login now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
