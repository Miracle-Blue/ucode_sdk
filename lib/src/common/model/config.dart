import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

/// {@template config}
/// Config class
/// {@endtemplate}
@immutable
class Config {
  /// {@macro config}
  Config({
    required this.projectId,
    required String baseUrl,
    required Duration timeout,
    String? appId,
    String? token,
  })  : assert(appId != null || token != null, 'You have to enter AppId or Token'),
        dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            sendTimeout: timeout,
            receiveTimeout: timeout,
            headers: {
              if (appId != null) ...{
                'authorization': 'API-KEY',
                'X-API-KEY': appId,
              } else if (token != null) ...{
                'authorization': token,
              }
            },
          ),
        );

  final String projectId;

  final Dio dio;
}
