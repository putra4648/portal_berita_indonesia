import 'package:api_client/src/exception/base_exception.dart';

/// Exception for handling Unauthorized (401)
class UnauthorizedException extends BaseException {
  /// {@macro unauthorized_exception}
  UnauthorizedException(super.code, super.message);
}
