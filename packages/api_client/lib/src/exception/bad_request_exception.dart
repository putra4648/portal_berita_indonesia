import 'package:api_client/src/exception/base_exception.dart';

/// Exception for handling Bad Request (400)
class BadRequestException extends BaseException {
  /// {@macro bad_request_exception}
  BadRequestException(super.code, super.message);
}
