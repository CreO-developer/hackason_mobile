import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> registerUser(String email, String password);
  Future<UserCredential?> loginUser(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> logoutUser();
  Future<void> deleteUser();
}
