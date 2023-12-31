import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddy/providers/auth_provider.dart';
import 'package:gymbuddy/screen/auth/login_or_register_screen.dart';
import 'package:gymbuddy/screen/tabs.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            Future(
              () => ref
                  .read(authStateChangeProvider.notifier)
                  .update((state) => state = FirebaseAuth.instance.currentUser),
            );

            return const TabsScreen();
          }
          // user is not logged in
          return const LoginOrRegisterScreen();
        },
      ),
    );
  }
}
