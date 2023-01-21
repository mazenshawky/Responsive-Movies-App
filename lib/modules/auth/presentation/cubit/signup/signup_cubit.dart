import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:responsive_movies_app/core/error/failure.dart';
import 'package:responsive_movies_app/core/local/requests.dart';
import 'package:responsive_movies_app/core/utils/constants.dart';
import 'package:responsive_movies_app/modules/auth/domain/usecases/signup_usecase.dart';
import 'package:responsive_movies_app/modules/auth/presentation/common/freezed_data_classes.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState>
    with SignUpCubitInputs, SignUpCubitOutputs {
  final SignUpUseCase signUpUseCase;
  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());

  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  final StreamController isUserSignedUpSuccessfullyStreamController =
      StreamController<bool>.broadcast();

  var signUpObject = SignUpObject("", "");

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
    signUpObject = signUpObject.copyWith(username: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    signUpObject = signUpObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  signup() async {
    emit(SignUpLoading());
    Either<Failure, bool> response = await signUpUseCase(
        AuthRequest(signUpObject.username, signUpObject.password));

    emit(response.fold(
      (failure) => SignUpError(msg: Constants.mapFailureToMsg(failure)),
      (signedUp) {
        isUserSignedUpSuccessfullyStreamController.add(true);
        return SignUpSuccess();
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
          .map((_) => Constants.areAllSignUpInputsValid(signUpObject));
}

abstract class SignUpCubitInputs {
  setUserName(String username);

  setPassword(String password);

  signup();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;

  Sink get inputChangePasswordVisibility;
}

abstract class SignUpCubitOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;
}
