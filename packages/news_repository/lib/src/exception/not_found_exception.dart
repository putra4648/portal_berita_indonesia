import 'package:news_repository/src/exception/base_exception.dart';

/// Exception for handling Not Found (404)
class NotFoundException extends BaseException {
  /// {@macro not_found_exception}
  NotFoundException(super.code, super.message);
}
