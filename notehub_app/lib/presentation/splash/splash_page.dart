import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notehub_app/core/assets_path.dart';
import 'package:notehub_app/presentation/authen/login_page.dart';
import 'package:notehub_app/presentation/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        /// Check da login chua
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsPath.imgNoteHub, width: 96, height: 96),
      ),
    );
  }
}
