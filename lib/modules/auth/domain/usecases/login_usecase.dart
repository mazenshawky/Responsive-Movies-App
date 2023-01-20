import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:responsive_movies_app/core/local/requests.dart';
import 'package:responsive_movies_app/core/usecases/base_usecase.dart';
import 'package:responsive_movies_app/modules/auth/domain/repository/auth_repository.dart';

class LoginUseCase implements BaseUseCase<bool, AuthRequest> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(AuthRequest authRequest) async {
    return await authRepository.login(authRequest: authRequest);
  }
}
