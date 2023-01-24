import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPreferences {
  Future<bool> getIsUserLoggedIn();
  Future<String?> getLoggedUserUsername();
  void logout();
}

class AppPreferencesImpl implements AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesImpl({required this.sharedPreferences});

  @override
  Future<bool> getIsUserLoggedIn() async =>
      sharedPreferences.getBool(AppStrings.isUserLoggedInKey) ?? false;

  @override
  Future<String?> getLoggedUserUsername() async =>
      sharedPreferences.getString(AppStrings.loggedUserUsernameKey);

  @override
  void logout() {
    sharedPreferences.remove(AppStrings.isUserLoggedInKey);
    sharedPreferences.remove(AppStrings.loggedUserUsernameKey);
  }
}
