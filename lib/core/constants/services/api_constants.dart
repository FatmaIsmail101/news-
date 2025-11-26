import 'package:flutter_secure_storage/flutter_secure_storage.dart';
abstract class ApiConstants{
  static const String baseUrl="https://newsapi.org";
  static const String sourceEndPoint="https://newsapi.org/v2/top-headlines/sources";
  static const String newsEndPoint="https://newsapi.org/v2/everything";

}
class SecureStorageService {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveApiKey() async {
    String? apiKey = await _storage.read(key: "8dd6e3411eba4da6b55188bc949ae1ab");
    if (apiKey == null) {
      await _storage.write(
        key: "api_key",
        value: "8dd6e3411eba4da6b55188bc949ae1ab",
      );
    }
  }

  static Future<String?> getApiKey() async {
    return await _storage.read(key: "8dd6e3411eba4da6b55188bc949ae1ab");
  }
}




