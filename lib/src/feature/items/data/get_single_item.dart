import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template create_item}
/// CreateItem class
/// {@endtemplate}
class GetSingleItem {
  /// {@macro create_item}
  const GetSingleItem({
    required final Config config,
    required final String collection,
    required final String id,
  })  : _config = config,
        _collection = collection,
        _id = id;

  final Config _config;
  final String _collection;
  final String _id;

  Future<T> execSlim<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v1/object-slim/$_collection/$_id',
        method: Method.get,
      );
}
