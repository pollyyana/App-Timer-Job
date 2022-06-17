// import 'dart:ffi';

abstract class AuthService {
  Future<void> signIn();
  Future<void> signOut();
}
