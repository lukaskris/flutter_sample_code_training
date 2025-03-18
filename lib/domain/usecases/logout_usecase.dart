import 'package:flutter_training_2025/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  void call() {
    _authRepository.logout();
  }
}
