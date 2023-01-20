import 'package:dartz/dartz.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/core/local/requests.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signup({required AuthRequest authRequest});

  Future<Either<Failure, bool>> login({required AuthRequest authRequest});
}
