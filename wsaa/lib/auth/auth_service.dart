import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home/home_page.dart';
import 'login_page.dart';

class AuthService {
  // Determine if the user is authenticated
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  // Sign out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Sign in
  void signIn(String email, String password) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  // Sign up
  void signUp(String email, String password) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }
}
