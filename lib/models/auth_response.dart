import 'dart:convert';

import 'models.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.ok,
    required this.user,
    required this.token,
  });

  final bool ok;
  final User user;
  final String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    ok: json["ok"],
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "user": user.toJson(),
    "token": token,
  };
}
