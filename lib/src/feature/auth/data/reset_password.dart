import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template ResetPassword}
/// ResetPassword class
/// {@endtemplate}
class ResetPassword {
  /// {@macro ResetPassword}
  const ResetPassword({
    required final Config config,
    required final Map<String, Object?> data,
  })  : _config = config,
        _data = data;

  final Config _config;
  final Map<String, Object?> _data;

  ResetPasswordOptions headers(Map<String, Object?> header) =>
      ResetPasswordOptions(config: _config, header: header, data: _data);
}

/// {@template ResetPassword}
/// ResetPasswordOptions class
/// {@endtemplate}
class ResetPasswordOptions {
  /// {@macro ResetPassword}
  const ResetPasswordOptions({
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
        '/v2/reset-password',
        headers: _header,
        method: Method.put,
        data: _data,
      );
}
