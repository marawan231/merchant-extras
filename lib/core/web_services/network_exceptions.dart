// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_model.dart';

part 'network_exceptions.freezed.dart';

@freezed
class DioExceptionType with _$DioExceptionType {
  const factory DioExceptionType.requestCancelled() = RequestCancelled;

  const factory DioExceptionType.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory DioExceptionType.badRequest(String error) = BadRequest;

  const factory DioExceptionType.notFound(String reason) = NotFound;

  const factory DioExceptionType.methodNotAllowed() = MethodNotAllowed;

  const factory DioExceptionType.notAcceptable() = NotAcceptable;

  const factory DioExceptionType.requestTimeout() = RequestTimeout;

  const factory DioExceptionType.sendTimeout() = SendTimeout;

  const factory DioExceptionType.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory DioExceptionType.conflict(String error) = Conflict;

  const factory DioExceptionType.internalServerError() = InternalServerError;

  const factory DioExceptionType.notImplemented() = NotImplemented;

  const factory DioExceptionType.serviceUnavailable() = ServiceUnavailable;

  const factory DioExceptionType.noInternetConnection() = NoInternetConnection;

  const factory DioExceptionType.formatException() = FormatException;

  const factory DioExceptionType.unableToProcess() = UnableToProcess;

  const factory DioExceptionType.defaultError(String error) = DefaultError;

  static DioExceptionType handleResponse(Response? response) {
    ErrorModel errorModel = ErrorModel.fromJson(response?.data);

    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
        return DioExceptionType.badRequest("${errorModel.msg}");
      case 401:
      case 403:
        return DioExceptionType.unauthorizedRequest("${errorModel.msg}");
      case 404:
        return DioExceptionType.notFound("${errorModel.msg}");
      case 409:
        return DioExceptionType.conflict("${errorModel.msg}");
      case 408:
        return const DioExceptionType.requestTimeout();
      case 422:
        return DioExceptionType.unprocessableEntity("${errorModel.msg}");
      case 500:
        return const DioExceptionType.internalServerError();
      case 503:
        return const DioExceptionType.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return DioExceptionType.defaultError(
          "$responseCode",
        );
    }
  }

  static DioExceptionType getDioException(error) {
    if (error is Exception) {
      try {
        DioExceptionType networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const DioExceptionType.requestCancelled();
              break;
            case DioErrorType.connectionTimeout:
              networkExceptions = const DioExceptionType.requestTimeout();
              break;
            case DioErrorType.unknown:
              log("message ${error.message} ${error.response?.data}");
              networkExceptions =
                  const DioExceptionType.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const DioExceptionType.sendTimeout();
              break;
            case DioErrorType.badResponse:
              networkExceptions =
                  DioExceptionType.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const DioExceptionType.sendTimeout();
              break;
            default:
              networkExceptions = const DioExceptionType.unableToProcess();
              break;
          }
        }  else if (error is SocketException) {
          networkExceptions = const DioExceptionType.noInternetConnection();
        } else {
          networkExceptions = const DioExceptionType.unableToProcess();
        }
        return networkExceptions;
        // ignore: unused_catch_clause
      } on FormatException catch (e) {
        return const DioExceptionType.formatException();
      } catch (_) {
        return const DioExceptionType.unableToProcess();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        log("message $error ");

        // print(error.toString());
        return const DioExceptionType.unableToProcess();
      } else {
        return const DioExceptionType.unableToProcess();
      }
    }
  }

  static String getErrorMessage(DioExceptionType networkExceptions) {
    return networkExceptions.when(
      notImplemented: () => "Not Implemented",
      requestCancelled: () => "Request Cancelled",
      internalServerError: () => "Internal Server Error",
      notFound: (String reason) => reason,
      serviceUnavailable: () => "Service unavailable",
      methodNotAllowed: () => "Method Allowed",
      badRequest: (String error) => error,
      unauthorizedRequest: (String error) => error,
      unprocessableEntity: (String error) => error,
      // unknown: () => "Unexpected error occurred",
      requestTimeout: () => "Connection request timeout",
      sendTimeout: () => "Connection send timeout",
      notAcceptable: () => "Not Acceptable",
      conflict: (String error) => error,
      noInternetConnection: () => "No Internet Connection",
      formatException: () => "Format Exception",
      unableToProcess: () => "Unable to process the data",
      defaultError: (String error) => error,
    );
  }
}
