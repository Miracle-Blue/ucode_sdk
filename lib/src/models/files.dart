// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meta/meta.dart';

import '../common/model/config.dart';

/// {@template files}
/// ApiFiles class
/// {@endtemplate}
@immutable
class ApiFiles {
  /// {@macro files}
  const ApiFiles({required this.config});

  final Config? config;
}

/// {@template files}
/// UploadFile class
/// {@endtemplate}
@immutable
class UploadFile {
  /// {@macro files}
  const UploadFile({required this.config, required this.path});

  final Config? config;
  final String path;
}

/// {@template files}
/// DeleteFile class
/// {@endtemplate}
@immutable
class DeleteFile {
  /// {@macro files}
  const DeleteFile({required this.config, required this.id});

  final Config? config;
  final String id;
}

/// {@template files}
/// CreateFileResponse class
/// {@endtemplate}
@immutable
class CreateFileResponse {
  /// {@macro files}
  const CreateFileResponse({
    required this.status,
    required this.description,
    required this.data,
    required this.customMessage,
  });

  factory CreateFileResponse.fromJson(Map<String, Object?> json) => CreateFileResponse(
        status: json['status'] as String,
        description: json['description'] as String,
        data: CreateFileResponseData.fromJson(json['data'] as Map<String, Object?>),
        customMessage: json['custom_message'] as String,
      );

  final String status;
  final String description;
  final CreateFileResponseData data;
  final String customMessage;

  @override
  String toString() =>
      'CreateFileResponse(status: $status, description: $description, data: $data, customMessage: $customMessage)';
}

/// {@template files}
/// CreateFileResponseData class
/// {@endtemplate}
@immutable
class CreateFileResponseData {
  /// {@macro files}
  const CreateFileResponseData({
    required this.id,
    required this.title,
    required this.storage,
    required this.fileNameDisk,
    required this.fileNameDownload,
    required this.link,
    required this.fileSize,
  });

  factory CreateFileResponseData.fromJson(Map<String, Object?> json) => CreateFileResponseData(
        id: json['id'] as String,
        title: json['title'] as String,
        storage: json['storage'] as String,
        fileNameDisk: json['file_name_disk'] as String,
        fileNameDownload: json['file_name_download'] as String,
        link: json['link'] as String,
        fileSize: json['file_size'] as int,
      );

  final String id;
  final String title;
  final String storage;
  final String fileNameDisk;
  final String fileNameDownload;
  final String link;
  final int fileSize;

  @override
  String toString() =>
      'CreateFileResponseData(id: $id, title: $title, storage: $storage, fileNameDisk: $fileNameDisk, fileNameDownload: $fileNameDownload, link: $link, fileSize: $fileSize)';
}
