import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/custom_colored_log.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          enableSuggestions: true,
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          autocorrect: false,
          enableSuggestions: false,
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              CustomColoredLogs.logInfo(userCredential);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                CustomColoredLogs.logWarning('User not found');
              } else if (e.code == 'wrong-password') {
                CustomColoredLogs.logWarning('Wrong password');
              }
            }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
