import 'package:dartz/dartz.dart';
import 'package:flutter_training_2025/domain/repositories/auth_repository.dart';

class IsSessionUsecase {
  final AuthRepository _authRepository;

  IsSessionUsecase(this._authRepository);

  Future<Either<String, bool>> call() async {
    final isSessionActive = await _authRepository.isSessionActive();
    return Right(isSessionActive);
  }
}
