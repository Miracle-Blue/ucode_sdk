import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template login}
/// Login class
/// {@endtemplate}
class Login {
  /// {@macro login}
  const Login({
    required final Config config,
    required final Map<String, Object?> data,
  })  : _config = config,
        _data = data;

  final Config _config;
  final Map<String, Object?> _data;

  LoginOptions headers(Map<String, Object?> header) => LoginOptions(config: _config, header: header, data: _data);
}

/// {@template login}
/// LoginOptions class
/// {@endtemplate}
class LoginOptions {
  /// {@macro login}
  const LoginOptions({
    required final Config config,
    required final Map<String, Object?> header,
    required final Map<String, Object?> data,
  })  : _config = config,
        _header = header,
        _data = data;

  final Config _config;
  final Map<String, Object?> _header;
  final Map<String, Object?> _data;

  Future<T> exec<T>() async {
    _data['project_id'] ??= _config.projectId;

    return await ApiService(
      _config.dio,
    ).request<T>(
      '/v2/login',
      headers: _header,
      method: Method.post,
      data: _data,
    );
  }

  Future<T> execWithOption<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v2/login/with-option?project-id=${_config.projectId}',
        headers: _header,
        method: Method.post,
        data: _data,
      );
}
