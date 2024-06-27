import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/auth.dart';
import 'package:mobile/domain/repository/auth_repository.dart';
import 'package:mobile/constants/firebase_auth_error.dart';

final authRepository = Provider((ref) => AuthDataSource());

class AuthDataSource implements AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Auth> registerUser(String email, String password) async {
    Auth result = Auth(user: null, status: FirebaseAuthResultStatus.Undefined);

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        result = Auth(user: userCredential, status: FirebaseAuthResultStatus.Successful);
      } else {
        result = Auth(user: userCredential, status: FirebaseAuthResultStatus.Undefined);
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      result = Auth(user: null, status: FirebaseAuthExceptionHandler.handleException(e));
    }
    return result;
  }

  @override
  Future<Auth> loginUser(String email, String password) async {
    Auth result = const Auth(user: null, status: FirebaseAuthResultStatus.Undefined);

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        result = Auth(user: userCredential, status: FirebaseAuthResultStatus.Successful);
         print('e.code');
      } else {
        result = Auth(user: userCredential, status: FirebaseAuthResultStatus.Undefined);
        print('e.code');
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      result = Auth(user: null, status: FirebaseAuthExceptionHandler.handleException(e));
    }
    return result;
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
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

  @override
  Future<void> deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
