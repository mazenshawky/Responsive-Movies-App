import 'package:responsive_movies_app/core/error/cache_exceptions.dart';
import 'package:responsive_movies_app/core/local/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userKey = "USER_KEY_";
const counterKey = "COUNTER_KEY";
const isUserLoggedInKey = "IS_USER_LOGGED_IN_KEY";
const loggedUserUsernameKey = "LOGGED_USER_USERNAME_KEY";

abstract class AuthLocalDataSource {
  Future<bool> signup({required AuthRequest authRequest});

  Future<bool> login({required AuthRequest authRequest});

  Future<bool> getIsUserLoggedIn();

  void logout();
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

    return _addUser(counter, authRequest);
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

  @override
  Future<bool> getIsUserLoggedIn() async =>
      sharedPreferences.getBool(isUserLoggedInKey) ?? false;

  @override
  void logout() => sharedPreferences.remove(isUserLoggedInKey);

  int _getUsersNumber() => sharedPreferences.getInt(counterKey) ?? 0;

  bool _isUsernameUnique(int counter, AuthRequest authRequest) {
    if (counter == 0) {
      return true;
    }

    for (var i = 1; i <= counter; i++) {
      List<String>? user = sharedPreferences.getStringList('$userKey$i');
      if (user![0] == authRequest.username) {
        return false;
      }
    }

    return true;
  }

  Future<bool> _addUser(int counter, AuthRequest authRequest) async {
    counter++;

    await sharedPreferences.setInt(counterKey, counter);

    return await sharedPreferences.setStringList('$userKey$counter',
        <String>[authRequest.username, authRequest.password]);
  }

  bool _isUserValid(int counter, AuthRequest authRequest) {
    for (var i = 1; i <= counter; i++) {
      List<String>? user = sharedPreferences.getStringList('$userKey$i');
      if (user![0] == authRequest.username && user[1] == authRequest.password) {
        return true;
      }
    }

    return false;
  }

  Future<bool> _logUser(AuthRequest authRequest) async {
    await sharedPreferences.setBool(isUserLoggedInKey, true);

    return await sharedPreferences.setString(
        loggedUserUsernameKey, authRequest.username);
  }
}
