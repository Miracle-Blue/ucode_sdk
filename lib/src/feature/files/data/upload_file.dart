import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';

import '../../../common/model/config.dart';
import '../../../common/service/api_service.dart';
import '../../../models/files.dart';

/// {@template upload_file}
/// UploadFile class
/// {@endtemplate}
class UploadFile {
  /// {@macro upload_file}
  const UploadFile({
    required final Config config,
    required final File file,
  })  : _config = config,
        _file = file;

  final Config _config;
  final File _file;

  Future<CreateFileResponse?> exec() async => Isolate.run<CreateFileResponse?>(
        () async {
          try {
            final data = FormData();

            final fileName = _file.path.split('/').last;
            // final type = _file.path.split('.').last;

            data.files.add(
              MapEntry(
                'file',
                MultipartFile.fromBytes(
                  _file.readAsBytesSync(),
                  filename: fileName,
                  // contentType: MediaType(
                  //   type == 'jpg' || type == 'png' ? 'image' : 'document',
                  //   type,
                  // ),
                ),
              ),
            );

            final result = await _config.dio.fetch<Map<String, Object?>>(
              _setStreamType<void>(
                RequestOptions(
                  baseUrl: _config.dio.options.baseUrl,
                  headers: _config.dio.options.headers,
                  path: '/v1/files/folder_upload?folder_name=Media',
                  method: Method.post.name,
                  data: data,
                ),
              ),
            );

            if (result.statusCode == 200 || result.statusCode == 201) {
              return CreateFileResponse.fromJson(result.data ?? {});
            }

            return null;
          } on Object catch (_) {
            rethrow;
          }
        },
      );
}

RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
  if (T != dynamic &&
      !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
    if (T == String) {
      requestOptions.responseType = ResponseType.plain;
    } else {
      requestOptions.responseType = ResponseType.json;
    }
  }
  return requestOptions;
}
