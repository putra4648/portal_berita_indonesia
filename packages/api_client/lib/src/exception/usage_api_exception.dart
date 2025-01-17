import 'package:api_client/src/exception/base_exception.dart';

/// Exception for handling API limit has been reached (402)
class UsageApiException extends BaseException {
  /// {@macro usage_api_exception}
  UsageApiException(super.code, super.message);
}
