import 'package:meta/meta.dart';

@immutable
class Datas {
  const Datas({required this.data});

  factory Datas.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'data': {
            'data': {
              'data': final Map<String, Object?>? data,
            },
          },
        }) {
      return Datas(data: data ?? <String, Object?>{});
    } else {
      throw Error.throwWithStackTrace('Json Format Error : json response did not MATCH', StackTrace.current);
    }
  }

  final Map<String, Object?> data;

  Map<String, Object?> toJson() => {
        'data': {
          'data': {
            'data': data,
          },
        },
      };
}

@immutable
class ClientApiResponse {
  const ClientApiResponse({required this.data});

  factory ClientApiResponse.fromJson(Map<String, Object?> json) => ClientApiResponse(
        data: ClientApiData.fromJson(json['data'] as Map<String, Object?>),
      );

  final ClientApiData data;

  Map<String, Object?> toJson() => {
        'data': data.toJson(),
      };
}

@immutable
class ClientApiData {
  const ClientApiData({required this.data});

  factory ClientApiData.fromJson(Map<String, Object?> json) => ClientApiData(
        data: ClientApiResp.fromJson(json['data'] as Map<String, Object?>),
      );

  final ClientApiResp data;

  Map<String, Object?> toJson() => {
        'data': data.toJson(),
      };
}

@immutable
class ClientApiResp {
  const ClientApiResp({required this.response});

  factory ClientApiResp.fromJson(Map<String, Object?> json) => ClientApiResp(
        response: json['response'] as Map<String, Object?>,
      );

  final Map<String, Object?> response;

  Map<String, Object?> toJson() => {
        'response': response,
      };
}

@immutable
class Response {
  const Response({
    required this.status,
    required this.error,
    required this.data,
  });

  factory Response.fromJson(Map<String, Object?> json) => Response(
        status: json['status'] as String,
        error: json['error'] as String,
        data: json['data'] as Map<String, Object?>,
      );

  final String status;
  final String error;
  final Map<String, Object?> data;

  Map<String, Object?> toJson() => {
        'status': status,
        'error': error,
        'data': data,
      };
}

@immutable
class GetListClientApiResponse {
  const GetListClientApiResponse({required this.data});

  factory GetListClientApiResponse.fromJson(Map<String, Object?> json) => GetListClientApiResponse(
        data: GetListClientApiData.fromJson(json['data'] as Map<String, Object?>),
      );

  final GetListClientApiData data;

  Map<String, Object?> toJson() => {
        'data': data.toJson(),
      };
}

@immutable
class GetListClientApiData {
  const GetListClientApiData({required this.data});

  factory GetListClientApiData.fromJson(Map<String, Object?> json) => GetListClientApiData(
        data: GetListClientApiResp.fromJson(json['data'] as List<Object?>),
      );

  final GetListClientApiResp data;

  Map<String, Object?> toJson() => {
        'data': data.toJson(),
      };
}

@immutable
class GetListClientApiResp {
  const GetListClientApiResp({required this.response});

  factory GetListClientApiResp.fromJson(List<Object?> json) => GetListClientApiResp(
        response: json.whereType<Map<String, Object?>>().toList(),
      );

  final List<Map<String, Object?>> response;

  Map<String, Object?> toJson() => {
        'response': response,
      };
}

@immutable
class GetListAggregationClientApiResponse {
  const GetListAggregationClientApiResponse({required this.data});

  factory GetListAggregationClientApiResponse.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'data': {
            'data': {
              'data': final List<Object?>? datas,
            },
          },
        }) {
      return GetListAggregationClientApiResponse(
        data: datas?.whereType<Map<String, Object?>>().toList() ?? <Map<String, Object?>>[],
      );
    } else {
      throw Error.throwWithStackTrace('Json Format Error : json response did not MATCH', StackTrace.current);
    }
  }

  final List<Map<String, Object?>> data;

  Map<String, Object?> toJson() => {
        'data': {
          'data': {
            'data': data,
          },
        },
      };
}

@immutable
class ClientApiUpdateResponse {
  const ClientApiUpdateResponse({
    required this.status,
    required this.description,
    required this.tableSlug,
    required this.data,
  });

  factory ClientApiUpdateResponse.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'status': final String? status,
          'description': final String? description,
          'data': {
            'table_slug': final String? tableSlug,
            'data': final Map<String, Object?>? data,
          },
        }) {
      return ClientApiUpdateResponse(
        status: status ?? '',
        description: description ?? '',
        tableSlug: tableSlug ?? '',
        data: data ?? <String, Object?>{},
      );
    } else {
      throw Error.throwWithStackTrace('Json Format Error : json response did not MATCH', StackTrace.current);
    }
  }

  final String status;
  final String description;
  final String tableSlug;
  final Map<String, Object?> data;

  Map<String, Object?> toJson() => {
        'status': status,
        'description': description,
        'data': {
          'table_slug': tableSlug,
          'data': data,
        },
      };
}

@immutable
class ClientApiMultipleUpdateResponse {
  const ClientApiMultipleUpdateResponse({
    required this.status,
    required this.description,
    required this.objects,
  });

  factory ClientApiMultipleUpdateResponse.fromJson(Map<String, Object?> json) {
    if (json
        case {
          'status': final String? status,
          'description': final String? description,
          'data': {
            'data': {
              'objects': final List<Object?>? objects,
            },
          },
        }) {
      return ClientApiMultipleUpdateResponse(
        status: status ?? '',
        description: description ?? '',
        objects: objects?.whereType<Map<String, Object?>>().toList() ?? <Map<String, Object?>>[],
      );
    } else {
      throw Error.throwWithStackTrace('Json Format Error : json response did not MATCH', StackTrace.current);
    }
  }

  final String status;
  final String description;
  final List<Map<String, Object?>> objects;

  Map<String, Object?> toJson() => {
        'status': status,
        'description': description,
        'data': {
          'data': {
            'objects': objects,
          },
        },
      };
}

@immutable
class ResponseError {
  const ResponseError({
    required this.statusCode,
    required this.errorMessage,
    required this.clientErrorMessage,
    this.description,
  });

  factory ResponseError.fromJson(Map<String, Object?> json) => ResponseError(
        statusCode: json['statusCode'] as int,
        description: json['description'],
        errorMessage: json['errorMessage'] as String,
        clientErrorMessage: json['clientErrorMessage'] as String,
      );

  final int statusCode;
  final Object? description;
  final String errorMessage;
  final String clientErrorMessage;

  Map<String, Object?> toJson() => {
        'statusCode': statusCode,
        'description': description,
        'errorMessage': errorMessage,
        'clientErrorMessage': clientErrorMessage,
      };
}
