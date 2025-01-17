import 'package:api_client/src/exception/base_exception.dart';

/// Exception for handling Server in Maintenance Mode (503)
class MaintenanceException extends BaseException {
  /// {@macro maintenance_exception}
  MaintenanceException(super.code, super.message);
}
