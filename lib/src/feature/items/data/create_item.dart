import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';
import '../model/action_body.dart';

/// {@template create_item}
/// CreateItem class
/// {@endtemplate}
class CreateItem {
  /// {@macro create_item}
  const CreateItem({
    required final Config config,
    required final String collection,
    required final ActionBody body,
  })  : _config = config,
        _collection = collection,
        _body = body;

  final Config _config;
  final String _collection;
  final ActionBody _body;

  CreateItem disableFaas({required bool isDisable}) {
    final data = _body.copyWith(disableFaas: isDisable);

    return CreateItem(config: _config, collection: _collection, body: data);
  }

  Future<T> exec<T>() async => await ApiService(
        _config.dio,
      ).request<T>(
        '/v2/items/$_collection?from-ofs=${_body.disableFaas}',
        method: Method.post,
        data: _body.data,
      );
}
