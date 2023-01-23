import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_movies_app/app/app_prefs.dart';
import 'package:responsive_movies_app/app/bloc_observer.dart';
import 'package:responsive_movies_app/core/api/api_consumer.dart';
import 'package:responsive_movies_app/core/api/app_interceptors.dart';
import 'package:responsive_movies_app/core/api/dio_consumer.dart';
import 'package:responsive_movies_app/core/network/network_info.dart';
import 'package:responsive_movies_app/modules/auth/data/datasources/auth_local_data_source.dart';
import 'package:responsive_movies_app/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:responsive_movies_app/modules/auth/domain/repository/auth_repository.dart';
import 'package:responsive_movies_app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:responsive_movies_app/modules/auth/domain/usecases/signup_usecase.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/login/login_cubit.dart';
import 'package:responsive_movies_app/modules/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:responsive_movies_app/modules/home/data/datasources/movies_local_data_source.dart';
import 'package:responsive_movies_app/modules/home/data/datasources/movies_remote_data_source.dart';
import 'package:responsive_movies_app/modules/home/data/repository/movies_repository_impl.dart';
import 'package:responsive_movies_app/modules/home/domain/repository/movies_repository.dart';
import 'package:responsive_movies_app/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:responsive_movies_app/modules/home/presentation/cubit/dashboard/dashboard_cubit.dart';
import 'package:responsive_movies_app/modules/home/presentation/cubit/movies/movies_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Modules
  // Blocs
  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(signUpUseCase: sl()));
  sl.registerFactory<DashboardCubit>(
      () => DashboardCubit(appPreferences: sl()));
  sl.registerFactory<MoviesCubit>(() => MoviesCubit(getMoviesUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCase(moviesRepository: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authLocalDataSource: sl()));
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
      networkInfo: sl(),
      moviesRemoteDataSource: sl(),
      moviesLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<MoviesLocalDataSource>(
      () => MoviesLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton((() => AppPreferences(sharedPreferences: sl())));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppBlocObserver());
}
