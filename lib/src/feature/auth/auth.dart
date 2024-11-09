import 'package:meta/meta.dart';

import '../../common/model/config.dart';
import 'data/login.dart';
import 'data/register.dart';
import 'data/reset_password.dart';
import 'data/send_code.dart';

abstract interface class IAuth {
  Login login(Map<String, Object?> data);

  SendCode sendCode(Map<String, Object?> data);

  Register register(Map<String, Object?> data);

  ResetPassword resetPassword(Map<String, Object?> data);
}

/// {@template auth}
/// AuthImpl class
/// {@endtemplate}
@immutable
class AuthImpl implements IAuth {
  /// {@macro auth}
  const AuthImpl({required final Config config}) : _config = config;

  final Config _config;

  @override
  Login login(Map<String, Object?> data) => Login(config: _config, data: data);

  @override
  SendCode sendCode(Map<String, Object?> data) => SendCode(config: _config, data: data);

  @override
  Register register(Map<String, Object?> data) => Register(config: _config, data: data);

  @override
  ResetPassword resetPassword(Map<String, Object?> data) => ResetPassword(config: _config, data: data);
}
