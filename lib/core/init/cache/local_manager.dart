import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/local_keys_enum.dart';
import 'ILocalManager.dart';

class LocalManager extends ILocalManager {
  static LocalManager? _instance;
  LocalManager._();
  static LocalManager get instance => _instance ??= LocalManager._();
  SharedPreferences? _preferences;

  preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  @override
  Future<void> setStringValue(StorageKeys localKey, String value) async {
    await _preferences?.setString(localKey.toString(), value);
  }

  @override
  String? getStringValue(StorageKeys localKey) {
    return _preferences?.getString(localKey.toString());
  }
  
  @override
  Future<void> setBoolValue(StorageKeys localKey, bool value) async {
    await _preferences?.setBool(localKey.toString(), value);
  }

  @override
  bool getBoolValue(StorageKeys localKey) {
    return _preferences?.getBool(localKey.toString()) ?? false;
  }
}
