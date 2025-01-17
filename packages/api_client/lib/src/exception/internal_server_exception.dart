import 'package:api_client/src/exception/base_exception.dart';

/// Exception for handling Internal Server Error (500)
class InternalServerException extends BaseException {
  /// {@macro internal_server_exception}
  InternalServerException(super.code, super.message);
}
