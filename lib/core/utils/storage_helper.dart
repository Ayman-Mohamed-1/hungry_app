import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  /// Get value by key
  static Future<String?> getData(String key) async {
    return await _storage.read(key: key);
  }

  /// Get all stored values
  static Future<Map<String, String>> getAllData() async {
    return await _storage.readAll();
  }

  /// Save value
  static Future<void> saveData({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  /// Delete value by key
  static Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all stored values
  static Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }
}
