import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store/models/user.dart';

enum PrefKeys { id, name, email, mobile, gender, cityId, token, loggedIn, code }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void save({required User user}) {
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    _sharedPreferences.setString(PrefKeys.name.name, user.name);
    _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
    _sharedPreferences.setString(PrefKeys.cityId.name, user.cityId);
    _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
