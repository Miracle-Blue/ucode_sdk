import 'package:meta/meta.dart';

import '../../common/model/config.dart';
import 'data/api_function.dart';

abstract interface class IFunctions {
  ApiFunction invoke(Map<String, Object?> data);
}

/// {@template files}
/// FunctionsImpl class
/// {@endtemplate}
@immutable
class FunctionsImpl implements IFunctions {
  /// {@macro files}
  const FunctionsImpl({required final Config config, required final String path})
      : _config = config,
        _path = path;

  final Config _config;
  final String _path;

  @override
  ApiFunction invoke(Map<String, Object?> data) => ApiFunction(config: _config, path: _path, data: data);
}
