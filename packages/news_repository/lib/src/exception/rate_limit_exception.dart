import 'package:news_repository/src/exception/base_exception.dart';

/// Exception for handling Rate Limit (429)
class RateLimitException extends BaseException {
  /// {@macro rate_limit_exception}
  RateLimitException(super.code, super.message);
}
