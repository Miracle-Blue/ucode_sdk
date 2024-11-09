// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meta/meta.dart';

/// {@template action_body}
/// ActionBody class
/// {@endtemplate}
@immutable
class ActionBody {
  /// {@macro action_body}
  const ActionBody({
    required this.data,
    required this.disableFaas,
  });

  final Map<String, Object?> data;
  final bool disableFaas;

  ActionBody copyWith({
    Map<String, Object?>? data,
    bool? disableFaas,
  }) =>
      ActionBody(
        data: data ?? this.data,
        disableFaas: disableFaas ?? this.disableFaas,
      );
}
