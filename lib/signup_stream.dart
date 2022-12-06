// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_authentication/hello.dart';
import 'package:sign_in_authentication/signup.dart';

class SignupStream extends StatefulWidget {
  const SignupStream({Key? key}) : super(key: key);

  @override
  State<SignupStream> createState() => _StreamPageState();
}

class _StreamPageState extends State<SignupStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Went Wrong'));
          } else if (snapshot.hasData) {
            return HelloPage();
          } else {
            return SignUpPage();
          }
        });
  }
}
