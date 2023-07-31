import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenementz/auth/authentication.dart';
import 'package:tenementz/homeindex/render.dart';

class AuthStream extends StatelessWidget {
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Render();
          }
          return const Authentication();
        });
  }
}
