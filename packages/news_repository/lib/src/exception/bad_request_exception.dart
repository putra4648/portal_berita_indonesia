import 'package:news_repository/src/exception/base_exception.dart';

/// Exception for handling Bad Request (400)
class BadRequestException extends BaseException {
  /// {@macro bad_request_exception}
  BadRequestException(super.code, super.message);
}
