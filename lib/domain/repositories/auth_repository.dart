import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final _storage = FlutterSecureStorage();

  Future<Either<String, bool>> login(String email, String password) async {
    // Simulate a login failure when the user's password is not 'admin' and the email is 'admin'
    if (email == 'admin' && password != 'admin') {
      return Left('Invalid email or password');
    }
    // For all other cases, return true
    await _storage.write(key: 'session', value: 'active');
    return Right(true);
  }

  void logout() {
    // End the session
    _storage.delete(key: 'session');
  }

  Future<bool> isSessionActive() async {
    // Check if the session is active
    String? value = await _storage.read(key: 'session');
    return value == 'active';
  }
}
