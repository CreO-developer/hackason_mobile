import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/application/service/auth_service.dart';
import 'package:mobile/domain/entities/auth.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, User?>((ref) {
  return AuthStateNotifier(authService: ref.read(authService));
});

class AuthStateNotifier extends StateNotifier<User?> {
  AuthStateNotifier({required AuthService authService, User? initialUser})
      : _authService = authService,
        super(initialUser) {
    _auth.userChanges().listen((user) {
      state = user;
    });
  }

  final _auth = FirebaseAuth.instance;
  final AuthService _authService;

  Future<Auth> registerUser(String email, String password) async {
    final result = await _authService.registerUser(email, password);
    return result;
  }

  Future<Auth> lgoinUser(String email, String password) async {
    return await _authService.loginUser(email, password);
  }

  Future<UserCredential?> resetPassword(String email) async {
    return await _authService.resetPassword(email);
  }

  Future<void> logoutUser() async {
    await _authService.logoutUser();
  }

  Future<void> deleteUser() async {
    await _authService.deleteUser();
  }
}
