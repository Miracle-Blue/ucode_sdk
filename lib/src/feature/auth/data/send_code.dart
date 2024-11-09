import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template SendCode}
/// SendCode class
/// {@endtemplate}
class SendCode {
  /// {@macro SendCode}
  const SendCode({
    required final Config config,
    required final Map<String, Object?> data,
  })  : _config = config,
        _data = data;

  final Config _config;
  final Map<String, Object?> _data;

  SendCodeOptions headers(Map<String, Object?> header) => SendCodeOptions(config: _config, header: header, data: _data);
}

/// {@template SendCode}
/// SendCodeOptions class
/// {@endtemplate}
class SendCodeOptions {
  /// {@macro SendCode}
  const SendCodeOptions({
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
        '/v2/send-code',
        headers: _header,
        method: Method.post,
        data: _data,
      );
}
