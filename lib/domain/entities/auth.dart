import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/constants/firebase_auth_error.dart';

part 'auth.freezed.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
    UserCredential? user,
    required FirebaseAuthResultStatus status,
  }) = _Auth;
}
