import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/infrastracture/datasource/auth_data_source.dart';

import '../../domain/repository/auth_repository.dart';

final authService = Provider(
  (ref) => AuthService(
    authRepository: ref.read(authRepository),
  ),
);

class AuthService {
  AuthService({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  Future<UserCredential?> registerUser(String email, String password) async {
    final result = await _authRepository.registerUser(email, password);
    return result;
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    final result = await _authRepository.loginUser(email, password);
    return result;
  }

  Future<UserCredential?> resetPassword(String email) async {
    await _authRepository.resetPassword(email);
  }

  Future<UserCredential?> logoutUser() async {
    await _authRepository.logoutUser();
  }
}
