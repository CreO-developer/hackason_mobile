import 'package:mobile/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Auth> registerUser(String email, String password);
  Future<Auth> loginUser(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> logoutUser();
  Future<void> deleteUser();
}
