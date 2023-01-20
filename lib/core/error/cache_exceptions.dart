import 'package:equatable/equatable.dart';

class CacheException extends Equatable implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

class UsernameAlreadyExistsException extends CacheException {
  const UsernameAlreadyExistsException([message])
      : super("Username already exists");
}

class UserNotExistsException extends CacheException {
  const UserNotExistsException([message])
      : super("Invalid username or password");
}
