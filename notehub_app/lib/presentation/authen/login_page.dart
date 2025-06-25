import 'package:flutter/material.dart';
import 'package:notehub_app/core/extensions.dart';
import 'package:notehub_app/presentation/authen/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to NoteHub', style: TextStyle(color: Colors.blue)),
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
              SizedBox(height: 24),
              FilledButton(onPressed: () {}, child: Text('Login')),
              SizedBox(height: 14),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: Text(
                  'You do not have account? Sign up',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
