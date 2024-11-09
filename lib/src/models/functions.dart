import 'package:meta/meta.dart';

/// {@template functions}
/// ApiFunctions class
/// {@endtemplate}
@immutable
class FunctionResponse {
  /// {@macro functions}
  const FunctionResponse({
    required this.status,
    required this.description,
    this.data,
    this.customMessage,
  });

  final String status;
  final String description;
  final Object? data;
  final Object? customMessage;
}
