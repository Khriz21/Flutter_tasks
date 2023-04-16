// import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_tasks/models/auth_response.dart';
import 'package:my_tasks/models/models.dart';

class AuthProvider extends ChangeNotifier {
  final String urlBase = 'http://192.168.1.26:3000/api';

  late User user;
  final _storage = const FlutterSecureStorage();
  late bool _authenticating = false;

  bool get authenticating => _authenticating;

  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    return token ?? 'null';
  }

  //? Inicio de sesión
  Future<String?> login(String email, String password) async {
    _authenticating = true;
    notifyListeners();

    final Map<String, String> data = {'email': email, 'password': password};

    final res = await http.post(
      Uri.parse('$urlBase/auth'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    _authenticating = false;
    notifyListeners();

    if (res.statusCode == 200) {
      final authRes = authResponseFromJson(res.body);
      user = authRes.user;
      await _saveToken(authRes.token);

      return null;
    } else {
      final msg = jsonDecode(res.body);
      return msg['msg'] ?? 'Herror de conexion';
    }
  }

  //? Registrar el nuevo usuario
  Future<bool> sigup(
    String name,
    String lastName,
    String birthdate,
    String email,
    String password,
  ) async {
    _authenticating = true;
    notifyListeners();

    final Map<String, String> data = {
      'name': name,
      'las_name': lastName,
      'birtbirtdate': birthdate,
      'email': email,
      'password': password,
    };

    final res = await http.post(
      Uri.parse('$urlBase/aut/sigup'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 200) {
      final authRes = authResponseFromJson(res.body);
      user = authRes.user;
      await _saveToken(authRes.token);

      return true;
    } else {
      return false;
    }
  }

  // Renovar el token y mantener la conexión
  Future<bool> isLoggeddin() async {
    final token = await _storage.read(key: 'token');

    final res = await http.get(
      Uri.parse('$urlBase/auth/renew'),
      headers: {
        'x-token': token.toString(),
      },
    );

    if (res.statusCode == 200) {
      final authRes = authResponseFromJson(res.body);
      user = authRes.user;
      await _saveToken(authRes.token);
      return true;
    } else {
      logout();
      return false;
    }
  }

  // ? Guardar y borrar el token
  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: 'token');
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future<void> logout() async => await _storage.delete(key: 'token');
}
