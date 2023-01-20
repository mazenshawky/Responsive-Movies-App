import 'package:responsive_movies_app/core/error/cache_exceptions.dart';
import 'package:responsive_movies_app/core/local/requests.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:responsive_movies_app/modules/auth/data/datasources/auth_local_data_source.dart';
import 'package:responsive_movies_app/modules/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, bool>> signup(
      {required AuthRequest authRequest}) async {
    try {
      final signedUp =
          await authLocalDataSource.signup(authRequest: authRequest);
      return Right(signedUp);
    } on UsernameAlreadyExistsException {
      return Left(UsernameAlreadyExistsFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> login(
      {required AuthRequest authRequest}) async {
    try {
      final loggedIn =
          await authLocalDataSource.login(authRequest: authRequest);
      return Right(loggedIn);
    } on UserNotExistsException {
      return Left(UserNotExistsFailure());
    }
  }
}
