import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy/screen/auth/login_or_register_screen.dart';
import 'package:gymbuddy/screen/tabs.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return TabsScreen();
          }
          // user is not logged in
          return LoginOrRegisterScreen();
        },
      ),
    );
  }
}