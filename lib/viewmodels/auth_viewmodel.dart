import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../core/services/shared_prefs.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isLoggedIn => SharedPrefs.isLoggedIn;

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    SharedPrefs.isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    SharedPrefs.isLoggedIn = false;
    notifyListeners();
  }
}