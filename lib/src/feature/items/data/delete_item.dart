import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template create_item}
/// CreateItem class
/// {@endtemplate}
class DeleteItem {
  /// {@macro create_item}
  const DeleteItem({
    required final Config config,
    required final String collection,
    required final bool disableFaas,
  })  : _config = config,
        _collection = collection,
        _disableFaas = disableFaas;

  final Config _config;
  final String _collection;
  final bool _disableFaas;

  DeleteItem disableFaas({required bool isDisable}) => DeleteItem(
        config: _config,
        collection: _collection,
        disableFaas: isDisable,
      );

  DeleteSingle single(String id) => DeleteSingle(
        config: _config,
        collection: _collection,
        disableFaas: _disableFaas,
        id: id,
      );

  DeleteMultiple multiple(List<String> ids) {
    if (ids.isEmpty) throw Error.throwWithStackTrace('The "ids" list cannot be empty.', StackTrace.current);

    return DeleteMultiple(config: _config, collection: _collection, disableFaas: _disableFaas, ids: ids);
  }
}

/// {@template create_item}
/// DeleteSingle class
/// {@endtemplate}
class DeleteSingle {
  /// {@macro create_item}
  const DeleteSingle({
    required final Config config,
    required final String collection,
    required final bool disableFaas,
    required final String id,
  })  : _config = config,
        _id = id,
        _collection = collection,
        _disableFaas = disableFaas;

  final Config _config;
  final String _collection;
  final bool _disableFaas;
  final String _id;

  Future<T> exec<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v2/items/$_collection/$_id?from-ofs=$_disableFaas',
        method: Method.delete,
        data: {
          'data': <String, Object?>{},
        },
      );
}

/// {@template create_item}
/// DeleteMultiple class
/// {@endtemplate}
class DeleteMultiple {
  /// {@macro create_item}
  const DeleteMultiple({
    required final Config config,
    required final String collection,
    required final bool disableFaas,
    required final List<String> ids,
  })  : _config = config,
        _ids = ids,
        _collection = collection,
        _disableFaas = disableFaas;

  final Config _config;
  final String _collection;
  final bool _disableFaas;
  final List<String> _ids;

  Future<T> exec<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v1/object/$_collection?from-ofs=$_disableFaas',
        method: Method.delete,
        data: {
          'ids': _ids,
        },
      );
}
