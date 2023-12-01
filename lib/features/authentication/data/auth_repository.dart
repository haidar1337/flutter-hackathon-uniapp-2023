import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository({required this.context});

  final FirebaseAuth _firebaseAuthinstance = FirebaseAuth.instance;
  final BuildContext context;

  Future<bool> signIn(String? studentId, String? password) async {
    if (studentId == null || password == null) {
      return false;
    }

    _firebaseAuthinstance.signInWithEmailAndPassword(
        email: studentId, password: password);

    return true;
  }

  Future<void> signOut() async {
    _firebaseAuthinstance.signOut();
  }

  get user => _firebaseAuthinstance.currentUser;
  Stream<User?> get authStateChanges =>
      _firebaseAuthinstance.authStateChanges();
}

final authenticationRepositoryProvider =
    Provider.family<AuthRepository, BuildContext>((ref, context) {
  return AuthRepository(context: context);
});
