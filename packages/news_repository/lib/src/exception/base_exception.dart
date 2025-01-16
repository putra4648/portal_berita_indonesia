/// Main exception clas
abstract class BaseException implements Exception {
  /// {@macro base_exception}
  BaseException(this.code, this.message);

  /// exception message
  final String message;

  /// exception code
  final String code;
}
