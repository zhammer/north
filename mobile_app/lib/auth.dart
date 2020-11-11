import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
const _key = "north_access_token";

Future<String> getTokenFromStorage() async {
  return await storage.read(key: _key);
}

class Auth with ChangeNotifier {
  String _accessToken = "";

  // asynchronously load access token from storage... not _the best_
  Auth() {
    _load();
  }

  Future<void> _load() async {
    _accessToken = await getTokenFromStorage();
    notifyListeners();
  }

  Future<void> clear() async {
    _accessToken = "";
    await storage.write(key: _key, value: _accessToken);
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    _accessToken = token;
    await storage.write(key: _key, value: _accessToken);
    notifyListeners();
  }

  bool loggedIn() {
    return _accessToken != "";
  }
}
