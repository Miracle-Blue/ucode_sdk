import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template api_function}
/// ApiFunctionImpl class
/// {@endtemplate}
class ApiFunction {
  /// {@macro api_function}
  const ApiFunction({
    required final Config config,
    required final String path,
    required final Map<String, Object?> data,
  })  : _config = config,
        _data = data,
        _path = path;

  final Config _config;
  final Map<String, Object?> _data;
  final String _path;

  Future<T> exec<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v1/invoke_function/$_path',
        method: Method.post,
        data: _data,
      );
}
