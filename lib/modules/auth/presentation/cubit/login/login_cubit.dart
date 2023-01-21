import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/core/local/requests.dart';
import 'package:responsive_movies_app/core/utils/constants.dart';
import 'package:responsive_movies_app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:responsive_movies_app/modules/auth/presentation/common/freezed_data_classes.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState>
    with LoginCubitInputs, LoginCubitOutputs {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  var loginObject = LoginObject("", "");

  // inputs
  @override
  Sink get inputUserName => _usernameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputChangePasswordVisibility =>
      _passwordVisibilityStreamController.sink;

  @override
  setUserName(String username) {
    inputUserName.add((username));
    loginObject = loginObject.copyWith(username: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  changePasswordVisibility(bool state) => state
      ? _passwordVisibilityStreamController.add(false)
      : _passwordVisibilityStreamController.add(true);

  @override
  login() async {
    emit(LoginLoading());
    Either<Failure, bool> response = await loginUseCase(
        AuthRequest(loginObject.username, loginObject.password));

    emit(response.fold(
      (failure) => LoginError(msg: Constants.mapFailureToMsg(failure)),
      (loggedIn) {
        return LoginSuccess();
      },
    ));
  }

  // outputs
  @override
  Stream<bool> get outIsUserNameValid => _usernameStreamController.stream
      .map((username) => Constants.isUsernameValid(username));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => Constants.isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => Constants.areAllLoginInputsValid(loginObject));

  @override
  Stream<bool> get outIsPasswordVisible =>
      _passwordVisibilityStreamController.stream.map((state) => state);
}

abstract class LoginCubitInputs {
  setUserName(String username);

  setPassword(String password);

  changePasswordVisibility(bool state);

  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;

  Sink get inputChangePasswordVisibility;
}

abstract class LoginCubitOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsPasswordVisible;
}
