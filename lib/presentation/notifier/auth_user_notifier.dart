import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/application/service/auth_service.dart';

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

  Future<UserCredential?> registerUser(String email, String password) async {
    final result = await _authService.registerUser(email, password);
    return result;
  }

  Future<UserCredential?> lgoinUser(String email, String password) async {
    return await _authService.loginUser(email, password);
  }

  Future<void> logoutUser() async {
    await _authService.logoutUser();
  }
}
