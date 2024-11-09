import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

enum Method { get, post, put, patch, delete }

@immutable
class ApiService {
  const ApiService(this.dio);

  final Dio dio;

  FutureOr<T> request<T>(
    String path, {
    Method method = Method.get,
    bool setToken = true,
    Object? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    FormData? formData,
  }) async {
    final newHeaders = <String, Object?>{
      'content-Type': formData != null ? 'multipart/form-data' : 'application/json',
    };

    if (headers != null) newHeaders.addAll(headers);

    try {
      final response = await dio.request<Object?>(
        path,
        data: data ?? formData,
        queryParameters: queryParams,
        options: Options(
          method: method.name,
          headers: newHeaders,
        ),
      );

      if (response.statusCode == null || response.statusCode! > 204) {
        final convert = const JsonEncoder().cast<Object?, String?>().convert(response.data ?? {});
        final json = const JsonDecoder().cast<String, Map<String, Object?>>().convert(convert ?? '{}');

        if (json
            case {
              'status': final String? status,
              'description': final String? description,
              'data': final String? data,
            }) {
          throw Error.throwWithStackTrace(
            const JsonEncoder().cast<Map<String, Object?>, String>().convert(
              {
                'description': description,
                'status': status,
                'data': data,
                'message': "Can't send request",
                'isError': true,
              },
            ),
            StackTrace.current,
          );
        } else {
          throwError();
        }
      }

      return const JsonDecoder().cast<String, T>().convert(
            jsonEncode(response.data ?? {}),
          );
    } on DioException catch (error, stackTrace) {
      final convert = const JsonEncoder().cast<Object?, String?>().convert(error.response?.data ?? {});
      final json = const JsonDecoder().cast<String, Map<String, Object?>>().convert(convert ?? '{}');

      if (json
          case {
            'status': final String? status,
            'description': final String? description,
            'data': final String? data,
          }) {
        throw Error.throwWithStackTrace(
          const JsonEncoder().cast<Map<String, Object?>, String>().convert(
            {
              'description': description,
              'status': status,
              'data': data,
              'message': "Can't send request",
              'isError': true,
            },
          ),
          stackTrace,
        );
      } else {
        throwError();
      }
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      rethrow;
    }
  }

  Never throwError() => throw Error.throwWithStackTrace(
        const JsonEncoder().cast<Map<String, Object?>, String>().convert(
          {
            'description': 'Server Error',
            'status': 'Server Error',
            'data': 'Server Error',
            'message': "Can't send request",
            'isError': true,
          },
        ),
        StackTrace.current,
      );
}
