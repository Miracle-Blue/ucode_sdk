import 'package:meta/meta.dart';

/// {@template user}
/// User class
/// {@endtemplate}
@immutable
class User {
  /// {@macro user}
  const User({
    required this.id,
    required this.login,
    required this.password,
    required this.email,
    required this.phone,
    required this.name,
    required this.projectId,
    required this.roleId,
    required this.clientTypeId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        login: json['login'] as String,
        password: json['password'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        name: json['name'] as String,
        projectId: json['project_id'] as String,
        roleId: json['role_id'] as String,
        clientTypeId: json['client_type_id'] as String,
      );

  final String id;
  final String login;
  final String password;
  final String email;
  final String phone;
  final String name;
  final String projectId;
  final String roleId;
  final String clientTypeId;
}

/// {@template user}
/// Session class
/// {@endtemplate}
@immutable
class Session {
  /// {@macro user}
  const Session({
    required this.id,
    required this.projectId,
    required this.clientTypeId,
    required this.userId,
    required this.roleId,
    required this.createdAt,
    required this.updatedAt,
    required this.userIdAuth,
  });

  factory Session.fromJson(Map<String, Object?> json) => Session(
        id: json['id'] as String,
        projectId: json['project_id'] as String,
        clientTypeId: json['client_type_id'] as String,
        userId: json['user_id'] as String,
        roleId: json['role_id'] as String,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        userIdAuth: json['user_id_auth'] as String,
      );

  final String id;
  final String projectId;
  final String clientTypeId;
  final String userId;
  final String roleId;
  final String createdAt;
  final String updatedAt;
  final String userIdAuth;
}
