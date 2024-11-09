import 'package:meta/meta.dart';

/// {@template token}
/// Token class
/// {@endtemplate}
@immutable
class Token {
  /// {@macro token}
  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
    required this.refreshInSeconds,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json['access_token'] as String,
        refreshToken: json['refresh_token'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        expiresAt: DateTime.parse(json['expires_at'] as String),
        refreshInSeconds: json['refresh_in_seconds'] as int,
      );

  final String accessToken;
  final String refreshToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;
  final int refreshInSeconds;
}
