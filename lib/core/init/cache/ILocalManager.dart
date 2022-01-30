import '../../constants/enums/local_keys_enum.dart';

abstract class ILocalManager {
  Future<void> setStringValue(StorageKeys localKey, String value);
  String? getStringValue(StorageKeys localKey);
  Future<void> setBoolValue(StorageKeys localKey, bool value);
  bool getBoolValue(StorageKeys localKey);
}
