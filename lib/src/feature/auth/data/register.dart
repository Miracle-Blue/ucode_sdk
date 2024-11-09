import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template Register}
/// Register class
/// {@endtemplate}
class Register {
  /// {@macro Register}
  const Register({
    required final Config config,
    required final Map<String, Object?> data,
  })  : _config = config,
        _data = data;

  final Config _config;
  final Map<String, Object?> _data;

  RegisterOptions headers(Map<String, Object?> header) => RegisterOptions(config: _config, header: header, data: _data);
}

/// {@template Register}
/// RegisterOptions class
/// {@endtemplate}
class RegisterOptions {
  /// {@macro Register}
  const RegisterOptions({
    required final Config config,
    required final Map<String, Object?> header,
    required final Map<String, Object?> data,
  })  : _config = config,
        _header = header,
        _data = data;

  final Config _config;
  final Map<String, Object?> _header;
  final Map<String, Object?> _data;

  Future<T> exec<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v2/register?project-id=${_config.projectId}',
        headers: _header,
        method: Method.post,
        data: _data,
      );
}
