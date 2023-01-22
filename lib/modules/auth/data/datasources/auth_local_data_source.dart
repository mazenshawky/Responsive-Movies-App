import 'package:responsive_movies_app/core/error/cache_exceptions.dart';
import 'package:responsive_movies_app/core/local/requests.dart';
import 'package:responsive_movies_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> signup({required AuthRequest authRequest});

  Future<bool> login({required AuthRequest authRequest});
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> signup({required AuthRequest authRequest}) async {
    int counter = _getUsersNumber();
    bool isUsernameUnique = _isUsernameUnique(counter, authRequest);

    if (!isUsernameUnique) {
      throw const UsernameAlreadyExistsException();
    }

    _addUser(counter, authRequest);

    return _logUser(authRequest);
  }

  @override
  Future<bool> login({required AuthRequest authRequest}) async {
    int counter = _getUsersNumber();
    bool isUserValid = _isUserValid(counter, authRequest);

    if (!isUserValid) {
      throw const UserNotExistsException();
    }

    return _logUser(authRequest);
  }

  int _getUsersNumber() => sharedPreferences.getInt(AppStrings.counterKey) ?? 0;

  bool _isUsernameUnique(int counter, AuthRequest authRequest) {
    // first user in the database
    if (counter == 0) {
      return true;
    }

    for (var i = 1; i <= counter; i++) {
      List<String>? user =
          sharedPreferences.getStringList('${AppStrings.userKey}$i');
      if (user![0] == authRequest.username) {
        return false;
      }
    }

    return true;
  }

  Future<bool> _addUser(int counter, AuthRequest authRequest) async {
    counter++;

    await sharedPreferences.setInt(AppStrings.counterKey, counter);

    return await sharedPreferences.setStringList(
        '${AppStrings.userKey}$counter',
        <String>[authRequest.username, authRequest.password]);
  }

  bool _isUserValid(int counter, AuthRequest authRequest) {
    for (var i = 1; i <= counter; i++) {
      List<String>? user =
          sharedPreferences.getStringList('${AppStrings.userKey}$i');
      if (user![0] == authRequest.username && user[1] == authRequest.password) {
        return true;
      }
    }

    return false;
  }

  Future<bool> _logUser(AuthRequest authRequest) async {
    await sharedPreferences.setBool(AppStrings.isUserLoggedInKey, true);

    return await sharedPreferences.setString(
        AppStrings.loggedUserUsernameKey, authRequest.username);
  }
}
