import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'exceptions.dart';

/// Centralized error handler for the application
class ErrorHandler {
  static const String _defaultErrorMessage = 'An unexpected error occurred';

  /// Handles any exception and converts it to appropriate AppException
  static AppException handleError(dynamic error) {
    if (error is AppException) {
      return error;
    }

    // Network errors
    if (error.toString().contains('SocketException') ||
        error.toString().contains('Connection') ||
        error.toString().contains('Network')) {
      return NetworkException(
        message: 'Network connection failed',
        code: 'NETWORK_ERROR',
        originalError: error,
      );
    }

    // Timeout errors
    if (error.toString().contains('Timeout') ||
        error.toString().contains('Deadline')) {
      return NetworkException(
        message: 'Request timed out',
        code: 'TIMEOUT_ERROR',
        originalError: error,
      );
    }

    // HTTP status errors
    if (error.toString().contains('400') ||
        error.toString().contains('Bad Request')) {
      return ApiException(
        message: 'Invalid request',
        statusCode: 400,
        code: 'BAD_REQUEST',
        originalError: error,
      );
    }

    if (error.toString().contains('401') ||
        error.toString().contains('Unauthorized')) {
      return AuthException(
        message: 'Authentication failed',
        code: 'UNAUTHORIZED',
        originalError: error,
      );
    }

    if (error.toString().contains('403') ||
        error.toString().contains('Forbidden')) {
      return AuthException(
        message: 'Access denied',
        code: 'FORBIDDEN',
        originalError: error,
      );
    }

    if (error.toString().contains('404') ||
        error.toString().contains('Not Found')) {
      return ApiException(
        message: 'Resource not found',
        statusCode: 404,
        code: 'NOT_FOUND',
        originalError: error,
      );
    }

    if (error.toString().contains('500') ||
        error.toString().contains('Internal Server Error')) {
      return ApiException(
        message: 'Server error occurred',
        statusCode: 500,
        code: 'SERVER_ERROR',
        originalError: error,
      );
    }

    // Validation errors
    if (error.toString().contains('validation') ||
        error.toString().contains('invalid') ||
        error.toString().contains('required')) {
      return ValidationException(
        message: 'Validation failed',
        code: 'VALIDATION_ERROR',
        originalError: error,
      );
    }

    // Default unknown error
    return UnknownException(
      message: error.toString().isNotEmpty
          ? error.toString()
          : _defaultErrorMessage,
      code: 'UNKNOWN_ERROR',
      originalError: error,
    );
  }

  /// Logs error details for debugging
  static void logError(AppException error, {String? context}) {
    if (kDebugMode) {
      developer.log(
        'Error: ${error.message}',
        name: 'ErrorHandler',
        error: error.originalError,
        stackTrace: StackTrace.current,
      );

      if (context != null) {
        developer.log('Context: $context', name: 'ErrorHandler');
      }

      if (error.code != null) {
        developer.log('Error Code: ${error.code}', name: 'ErrorHandler');
      }
    }
  }

  /// Gets user-friendly error message
  static String getUserMessage(AppException error) {
    switch (error.runtimeType) {
      case NetworkException:
        return 'Please check your internet connection and try again.';
      case ApiException:
        final apiException = error as ApiException;
        if (apiException.statusCode == 404) {
          return 'The requested information was not found.';
        } else if (apiException.statusCode != null &&
            apiException.statusCode! >= 500) {
          return 'Server is temporarily unavailable. Please try again later.';
        }
        return 'Something went wrong. Please try again.';
      case ValidationException:
        return error.message;
      case AuthException:
        return 'Authentication failed. Please log in again.';
      case UnknownException:
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Safely executes async operations with error handling
  static Future<T> safeExecute<T>(
    Future<T> Function() operation, {
    String? context,
    AppException? onError,
  }) async {
    try {
      return await operation();
    } catch (error) {
      final appException = onError ?? handleError(error);
      logError(appException, context: context);
      throw appException;
    }
  }

  /// Executes async operation and returns Result type
  static Future<Result<T>> safeExecuteResult<T>(
    Future<T> Function() operation, {
    String? context,
  }) async {
    try {
      final result = await operation();
      return Result.success(result);
    } catch (error) {
      final appException = handleError(error);
      logError(appException, context: context);
      return Result.failure(appException);
    }
  }
}

/// Result type for safer error handling
class Result<T> {
  final T? data;
  final AppException? error;
  final bool isSuccess;

  const Result._({this.data, this.error, required this.isSuccess});

  factory Result.success(T data) {
    return Result._(data: data, isSuccess: true);
  }

  factory Result.failure(AppException error) {
    return Result._(error: error, isSuccess: false);
  }

  bool get isFailure => !isSuccess;

  T get requireData {
    if (isSuccess && data != null) {
      return data!;
    }
    throw error ?? UnknownException(message: 'No data available');
  }

  T? get getOrNull => isSuccess ? data : null;

  T getOrElse(T defaultValue) =>
      isSuccess ? data ?? defaultValue : defaultValue;

  Result<R> map<R>(
    R Function(T data) onSuccess,
    AppException Function(AppException error) onFailure,
  ) {
    if (isSuccess && data != null) {
      return Result.success(onSuccess(data!));
    } else {
      return Result.failure(onFailure(error!));
    }
  }
}
