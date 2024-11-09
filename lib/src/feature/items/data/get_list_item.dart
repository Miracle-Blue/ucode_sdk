// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';

/// {@template create_item}
/// CreateItem class
/// {@endtemplate}
class GetListItem {
  /// {@macro create_item}
  const GetListItem({
    required final Config config,
    required final String collection,
    required final Map<String, Object?> query,
    final int page = 0,
    final int limit = 0,
  })  : _config = config,
        _collection = collection,
        _query = query,
        _page = page,
        _limit = limit;

  final Config _config;
  final String _collection;
  final Map<String, Object?> _query;
  final int _page;
  final int _limit;

  GetListItem limit(int limitCount) {
    final _l = limitCount <= 0 ? 10 : limitCount;

    return _copyWith(
      limit: _l,
    );
  }

  GetListItem page(int pageCount) {
    final _p = pageCount <= 0 ? 1 : pageCount;

    return _copyWith(
        page: _p,
      );
  }

  GetListItem filter(Map<String, Object?> filterData) => _copyWith(
        query: {
          ..._query,
          ...filterData,
        },
      );

  GetListItem search(String searchString) => _copyWith(
        query: {
          ..._query,
          'search': searchString,
        },
      );

  GetListItem sort(Map<String, Object?> sortData) => _copyWith(
        query: {
          ..._query,
          'order': sortData,
        },
      );

  GetListItem viewFields(List<String> fields) => _copyWith(
        query: {
          ..._query,
          'view_fields': fields,
        },
      );

  GetListItem withRelations({required bool withIn}) => _copyWith(
        query: {
          ..._query,
          'with_relations': withIn,
        },
      );

  Future<T> exec<T>() async {
    final queryToString = const JsonEncoder().cast<Map<String, Object?>, String>().convert(_query);

    return await ApiService(
      _config.dio,
    ).request<T>(
      '/v2/object-slim/get-list/$_collection?from-ofs=true&data=$queryToString&offset=${(_page - 1) * _limit}&limit=$_limit',
      method: Method.get,
    );
  }

  GetListItem _copyWith({
    Config? config,
    String? collection,
    Map<String, Object?>? query,
    int? page,
    int? limit,
  }) =>
      GetListItem(
        config: config ?? _config,
        collection: collection ?? _collection,
        query: query ?? _query,
        page: page ?? _page,
        limit: limit ?? _limit,
      );
}
