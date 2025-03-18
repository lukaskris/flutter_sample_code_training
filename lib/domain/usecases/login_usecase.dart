import 'package:dartz/dartz.dart';
import 'package:flutter_training_2025/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<String, bool>> call(String email, String password) async {
    return _authRepository.login(email, password);
  }
}
