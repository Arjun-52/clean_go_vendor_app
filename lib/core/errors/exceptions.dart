/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => 'AppException: $message';
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

/// API related exceptions
class ApiException extends AppException {
  final int? statusCode;

  const ApiException({
    required String message,
    this.statusCode,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

/// Validation exceptions
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException({
    required String message,
    this.fieldErrors,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

/// Authentication exceptions
class AuthException extends AppException {
  const AuthException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}

/// Unknown exceptions for unexpected errors
class UnknownException extends AppException {
  const UnknownException({
    required String message,
    String? code,
    dynamic originalError,
  }) : super(
          message: message,
          code: code,
          originalError: originalError,
        );
}
