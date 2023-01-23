// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:responsive_movies_app/modules/home/domain/usecases/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;

  MoviesCubit({required this.getMoviesUseCase}) : super(MoviesInitial());
}
