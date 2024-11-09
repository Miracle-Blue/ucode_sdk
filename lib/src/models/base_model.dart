import 'package:meta/meta.dart';

@immutable
class Request {
  const Request({
    required this.data,
    required this.isCached,
  });

  factory Request.fromJson(Map<String, Object?> json) => Request(
        data: json['data'] as Map<String, Object?>,
        isCached: json['is_cached'] as bool,
      );

  final Map<String, Object?> data;
  final bool isCached;

  Map<String, Object?> toJson() => {
        'data': data,
        'is_cached': isCached,
      };
}

@immutable
class Argument {
  const Argument({
    required this.appId,
    required this.tableSlug,
    required this.request,
    required this.disableFaas,
  });

  factory Argument.fromJson(Map<String, Object?> json) => Argument(
        appId: json['app_id'] as String,
        tableSlug: json['table_slug'] as String,
        request: Request.fromJson(json['request'] as Map<String, Object?>),
        disableFaas: json['disable_faas'] as bool,
      );

  final String appId;
  final String tableSlug;
  final Request request;
  final bool disableFaas;

  Map<String, Object?> toJson() => {
        'app_id': appId,
        'table_slug': tableSlug,
        'request': request.toJson(),
        'disable_faas': disableFaas,
      };
}

@immutable
class ArgumentWithPagination {
  const ArgumentWithPagination({
    required this.appId,
    required this.tableSlug,
    required this.request,
    required this.disableFaas,
    required this.limit,
    required this.page,
  });

  factory ArgumentWithPagination.fromJson(Map<String, Object?> json) => ArgumentWithPagination(
        appId: json['app_id'] as String,
        tableSlug: json['table_slug'] as String,
        request: Request.fromJson(json['request'] as Map<String, Object?>),
        disableFaas: json['disable_faas'] as bool,
        limit: json['limit'] as int,
        page: json['page'] as int,
      );

  final String appId;
  final String tableSlug;
  final Request request;
  final bool disableFaas;
  final int limit;
  final int page;

  Map<String, Object?> toJson() => {
        'app_id': appId,
        'table_slug': tableSlug,
        'request': request.toJson(),
        'disable_faas': disableFaas,
        'limit': limit,
        'page': page,
      };
}

@immutable
class Data {
  const Data({
    required this.appId,
    required this.method,
    required this.objectData,
    required this.objectIds,
    required this.tableSlug,
    required this.userId,
  });

  factory Data.fromJson(Map<String, Object?> json) => Data(
        appId: json['app_id'] as String,
        method: json['method'] as String,
        objectData: json['object_data'] as Map<String, Object?>,
        objectIds: (json['object_ids'] as List<Object?>).whereType<String>().toList(),
        tableSlug: json['table_slug'] as String,
        userId: json['user_id'] as String,
      );

  final String appId;
  final String method;
  final Map<String, Object?> objectData;
  final List<String> objectIds;
  final String tableSlug;
  final String userId;

  Map<String, Object?> toJson() => {
        'app_id': appId,
        'method': method,
        'object_data': objectData,
        'object_ids': objectIds,
        'table_slug': tableSlug,
        'user_id': userId,
      };
}
