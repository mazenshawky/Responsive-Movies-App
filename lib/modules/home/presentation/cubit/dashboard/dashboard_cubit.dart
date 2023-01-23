// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:responsive_movies_app/app/app_prefs.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:responsive_movies_app/core/utils/constants.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AppPreferences appPreferences;

  DashboardCubit({required this.appPreferences}) : super(DashboardInitial());

  Future<void> getHelloMessage() async {
    emit(DashboardLoading());
    String? name = await appPreferences.getLoggedUserUsername();
    if (name == null) {
      emit(const DashboardError(msg: AppStrings.cacheFailure));
    } else {
      String helloMessage = Constants.appendSomeTextToName(name);
      emit(DashboardSuccess(helloMessage: helloMessage));
    }
  }

  void logout() => appPreferences.logout();
}
