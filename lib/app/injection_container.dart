import 'package:get_it/get_it.dart';
import 'package:responsive_movies_app/app/bloc_observer.dart';
import 'package:responsive_movies_app/modules/auth/data/datasources/auth_local_data_source.dart';
import 'package:responsive_movies_app/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:responsive_movies_app/modules/auth/domain/repository/auth_repository.dart';
import 'package:responsive_movies_app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:responsive_movies_app/modules/auth/domain/usecases/signup_usecase.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/login/login_cubit.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Modules
  // Blocs
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit());
  sl.registerLazySingleton<SignUpCubit>(() => SignUpCubit());

  // Use Cases
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppBlocObserver());
}
