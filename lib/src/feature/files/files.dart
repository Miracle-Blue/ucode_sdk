import 'dart:io' show File;

import '../../common/model/config.dart';
import 'data/delete_file.dart';
import 'data/upload_file.dart';

abstract interface class IFiles {
  UploadFile upload(File file);

  DeleteFile delete(String fileId);
}

class FilesImpl implements IFiles {
  const FilesImpl({required final Config config}) : _config = config;

  final Config _config;

  @override
  UploadFile upload(File file) =>
      UploadFile(config: _config, file: file);

  @override
  DeleteFile delete(String fileId) => DeleteFile(config: _config, id: fileId);
}
