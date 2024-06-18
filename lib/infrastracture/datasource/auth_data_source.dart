import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/repository/auth_repository.dart';

final authRepository = Provider((ref) => AuthDataSource());

class AuthDataSource implements AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> registerUser(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserCredential?> loginUser(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
