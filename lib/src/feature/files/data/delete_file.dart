import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template delete_file}
/// DeleteFile class
/// {@endtemplate}
class DeleteFile {
  /// {@macro delete_file}
  const DeleteFile({
    required final Config config,
    required final String id,
  })  : _config = config,
        _id = id;

  final Config _config;
  final String _id;

  Future<T> exec<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v1/files/$_id',
        method: Method.delete,
        data: {'data': <String, Object?>{}},
      );
}
