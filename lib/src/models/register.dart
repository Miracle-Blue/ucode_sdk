import 'package:meta/meta.dart';

import '../common/model/config.dart';
import 'token.dart';
import 'user.dart';

/// {@template register}
/// ApiAuth class
/// {@endtemplate}
@immutable
class ApiAuth {
  /// {@macro register}
  const ApiAuth({required this.config});

  final Config? config;
}

/// {@template register}
/// RegisterResponse class
/// {@endtemplate}
@immutable
class RegisterResponse {
  /// {@macro register}
  const RegisterResponse({
    required this.status,
    required this.description,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, Object?> json) => RegisterResponse(
        status: json['status'] as String,
        description: json['description'] as String,
        data: RegisterResponseData.fromJson(json['data'] as Map<String, Object?>),
      );

  final String status;
  final String description;
  final RegisterResponseData data;
}

/// {@template register}
/// RegisterResponseData class
/// {@endtemplate}
@immutable
class RegisterResponseData {
  /// {@macro register}
  const RegisterResponseData({
    required this.userFound,
    required this.userId,
    required this.token,
    required this.loginTableSlug,
    required this.environmentId,
    required this.user,
    required this.userIdAuth,
  });

  factory RegisterResponseData.fromJson(Map<String, Object?> json) => RegisterResponseData(
        userFound: json['user_found'] as bool,
        userId: json['user_id'] as String,
        token: Token.fromJson(json['token'] as Map<String, Object?>),
        loginTableSlug: json['login_table_slug'] as String,
        environmentId: json['environment_id'] as String,
        user: User.fromJson(json['user'] as Map<String, Object?>),
        userIdAuth: json['user_id_auth'] as String,
      );

  final bool userFound;
  final String userId;
  final Token token;
  final String loginTableSlug;
  final String environmentId;
  final User user;
  final String userIdAuth;
}

/// {@template register}
/// LoginWithOptionResponse class
/// {@endtemplate}
@immutable
class LoginWithOptionResponse {
  /// {@macro register}
  const LoginWithOptionResponse({
    required this.status,
    required this.description,
    required this.data,
  });

  factory LoginWithOptionResponse.fromJson(Map<String, Object?> json) => LoginWithOptionResponse(
        status: json['status'] as String,
        description: json['description'] as String,
        data: LoginWithOptionResponseData.fromJson(json['data'] as Map<String, Object?>),
      );

  final String status;
  final String description;
  final LoginWithOptionResponseData data;
}

/// {@template register}
/// LoginWithOptionResponseData class
/// {@endtemplate}
@immutable
class LoginWithOptionResponseData {
  /// {@macro register}
  const LoginWithOptionResponseData({
    required this.userFound,
    required this.userId,
    required this.userData,
    required this.token,
    required this.sessions,
  });

  factory LoginWithOptionResponseData.fromJson(Map<String, Object?> json) => LoginWithOptionResponseData(
        userFound: json['user_found'] as bool,
        userId: json['user_id'] as String,
        token: Token.fromJson(json['token'] as Map<String, Object?>),
        sessions: (json['sessions'] as List).whereType<Map<String, Object?>>().map(Session.fromJson).toList(),
        userData: json['user_data'] as Map<String, Object?>,
      );

  final bool userFound;
  final String userId;
  final Token token;
  final List<Session> sessions;
  final Map<String, Object?> userData;
}

/// {@template register}
/// LoginResponse class
/// {@endtemplate}
@immutable
class LoginResponse {
  /// {@macro register}
  const LoginResponse({
    required this.status,
    required this.description,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, Object?> json) => LoginResponse(
        status: json['status'] as String,
        description: json['description'] as String,
        data: LoginResponseData.fromJson(json['data'] as Map<String, Object?>),
      );

  final String status;
  final String description;
  final LoginResponseData data;
}

/// {@template register}
/// LoginResponseData class
/// {@endtemplate}
@immutable
class LoginResponseData {
  /// {@macro register}
  const LoginResponseData({
    required this.userFound,
    required this.clientType,
    required this.userId,
    required this.role,
    required this.permissions,
    required this.loginTableSlug,
    required this.appPermissions,
    required this.resourceId,
    required this.environmentId,
    required this.globalPermission,
    required this.userData,
    required this.userIdAuth,
    required this.token,
    required this.sessions,
    required this.user,
  });

  factory LoginResponseData.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'user_found': final bool userFound,
          'client_type': final Map<String, Object?>? clientType,
          'user_id': final String userId,
          'role': final Map<String, Object?>? role,
          'token': final Map<String, Object?>? token,
          'permissions': final List<Object?>? permissions,
          'sessions': final List<Object?>? sessions,
          'login_table_slug': final String loginTableSlug,
          'app_permissions': final List<Object?>? appPermissions,
          'resource_id': final String resourceId,
          'environment_id': final String environmentId,
          'user': final Map<String, Object?>? user,
          'global_permission': final Map<String, Object?>? globalPermission,
          'user_data': final Map<String, Object?>? userData,
          'user_id_auth': final String userIdAuth,
        }) {
      return LoginResponseData(
        userFound: userFound,
        clientType: clientType ?? <String, Object?>{},
        userId: userId,
        role: role ?? <String, Object?>{},
        permissions: permissions?.whereType<Map<String, Object?>>().toList() ?? <Map<String, Object?>>[],
        loginTableSlug: loginTableSlug,
        appPermissions: appPermissions?.whereType<Map<String, Object?>>().toList() ?? <Map<String, Object?>>[],
        resourceId: resourceId,
        environmentId: environmentId,
        globalPermission: globalPermission ?? <String, Object?>{},
        userData: userData ?? <String, Object?>{},
        userIdAuth: userIdAuth,
        token: Token.fromJson(token as Map<String, Object?>),
        sessions: sessions?.whereType<Map<String, Object?>>().map(Session.fromJson).toList() ?? <Session>[],
        user: User.fromJson(user as Map<String, Object?>),
      );
    } else {
      throw Error.throwWithStackTrace('Json Format Error : json response did not MATCH', StackTrace.current);
    }
  }

  final bool userFound;
  final Map<String, Object?> clientType;
  final String userId;
  final Map<String, Object?> role;
  final Token token;
  final List<Map<String, Object?>> permissions;
  final List<Session> sessions;
  final String loginTableSlug;
  final List<Map<String, Object?>> appPermissions;
  final String resourceId;
  final String environmentId;
  final User user;
  final Map<String, Object?> globalPermission;
  final Map<String, Object?> userData;
  final String userIdAuth;
}

/// {@template register}
/// SendCodeResponse class
/// {@endtemplate}
@immutable
class SendCodeResponse {
  /// {@macro register}
  const SendCodeResponse({
    required this.status,
    required this.description,
    required this.data,
  });

  factory SendCodeResponse.fromJson(Map<String, Object?> json) => SendCodeResponse(
        status: json['status'] as String,
        description: json['description'] as String,
        data: SendCodeResponseData.fromJson(json['data'] as Map<String, Object?>),
      );

  final String status;
  final String description;
  final SendCodeResponseData data;
}

/// {@template register}
/// SendCodeResponseData class
/// {@endtemplate}
@immutable
class SendCodeResponseData {
  /// {@macro register}
  const SendCodeResponseData({
    required this.smsId,
    required this.googleAcces,
    required this.userFound,
  });

  factory SendCodeResponseData.fromJson(Map<String, Object?> json) => SendCodeResponseData(
        smsId: json['sms_id'] as String,
        googleAcces: json['google_acces'] as bool,
        userFound: json['user_found'] as bool,
      );

  final String smsId;
  final bool googleAcces;
  final bool userFound;
}
