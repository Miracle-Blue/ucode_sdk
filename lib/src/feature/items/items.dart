import '../../common/model/config.dart';
import 'data/create_item.dart';
import 'data/delete_item.dart';
import 'data/get_list_item.dart';
import 'data/get_single_item.dart';
import 'data/update_item.dart';
import 'model/action_body.dart';

abstract interface class Items {
  CreateItem create(Map<String, Object?> data);

  UpdateItem update(Map<String, Object?> data);

  DeleteItem delete();

  GetSingleItem getSingle(String id);

  GetListItem getList();
}

class ItemsImpl implements Items {
  const ItemsImpl({required final Config config, required final String collection})
      : _config = config,
        _collection = collection;

  final Config _config;
  final String _collection;

  @override
  CreateItem create(Map<String, Object?> data) => CreateItem(
        config: _config,
        collection: _collection,
        body: ActionBody(
          data: data,
          disableFaas: true,
        ),
      );

  @override
  UpdateItem update(Map<String, Object?> data) => UpdateItem(
        config: _config,
        collection: _collection,
        body: ActionBody(
          data: data,
          disableFaas: true,
        ),
      );

  @override
  DeleteItem delete() => DeleteItem(config: _config, collection: _collection, disableFaas: true);

  @override
  GetSingleItem getSingle(String id) => GetSingleItem(config: _config, collection: _collection, id: id);

  @override
  GetListItem getList() => GetListItem(config: _config, collection: _collection, query: {});
}
