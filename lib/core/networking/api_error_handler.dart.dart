import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

class ResponseCode {
  static const success = 200;
  static const noContent = 201;
  static const badRequest = 400;
  static const unauthorized = 401;
  static const forbidden = 403;
  static const notFound = 404;
  static const internalServerError = 500;
  static const apiLogicError = 422;

  static const connectTimeout = -1;
  static const cancel = -2;
  static const receiveTimeout = -3;
  static const sendTimeout = -4;
  static const cacheError = -5;
  static const noInternetConnection = -6;
  static const defaultError = -7;
}

class ResponseMessage {
  static const noContent = ApiErrors.noContent;
  static const badRequest = ApiErrors.badRequestError;
  static const unauthorized = ApiErrors.unauthorizedError;
  static const forbidden = ApiErrors.forbiddenError;
  static const notFound = ApiErrors.notFoundError;
  static const internalServerError = ApiErrors.internalServerError;

  static const connectTimeout = ApiErrors.timeoutError;
  static const cancel = ApiErrors.defaultError;
  static const receiveTimeout = ApiErrors.timeoutError;
  static const sendTimeout = ApiErrors.timeoutError;
  static const cacheError = ApiErrors.cacheError;
  static const noInternetConnection = ApiErrors.noInternetError;
  static const defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    final map = {
      DataSource.noContent: (ResponseCode.noContent, ResponseMessage.noContent),
      DataSource.badRequest: (
        ResponseCode.badRequest,
        ResponseMessage.badRequest,
      ),
      DataSource.unauthorized: (
        ResponseCode.unauthorized,
        ResponseMessage.unauthorized,
      ),
      DataSource.forbidden: (ResponseCode.forbidden, ResponseMessage.forbidden),
      DataSource.notFound: (ResponseCode.notFound, ResponseMessage.notFound),
      DataSource.internalServerError: (
        ResponseCode.internalServerError,
        ResponseMessage.internalServerError,
      ),
      DataSource.connectTimeout: (
        ResponseCode.connectTimeout,
        ResponseMessage.connectTimeout,
      ),
      DataSource.cancel: (ResponseCode.cancel, ResponseMessage.cancel),
      DataSource.receiveTimeout: (
        ResponseCode.receiveTimeout,
        ResponseMessage.receiveTimeout,
      ),
      DataSource.sendTimeout: (
        ResponseCode.sendTimeout,
        ResponseMessage.sendTimeout,
      ),
      DataSource.cacheError: (
        ResponseCode.cacheError,
        ResponseMessage.cacheError,
      ),
      DataSource.noInternetConnection: (
        ResponseCode.noInternetConnection,
        ResponseMessage.noInternetConnection,
      ),
      DataSource.defaultError: (
        ResponseCode.defaultError,
        ResponseMessage.defaultError,
      ),
    };

    final tuple =
        map[this] ?? (ResponseCode.defaultError, ResponseMessage.defaultError);
    return ApiErrorModel(statusCode: tuple.$1, message: tuple.$2);
  }
}

class ErrorHandler implements Exception {
  final ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error)
    : apiErrorModel =
          error is DioException
              ? _handleError(error)
              : DataSource.defaultError.getFailure();
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();
    case DioExceptionType.badResponse:
      final statusCode =
          error.response?.statusCode ?? ResponseCode.defaultError;
      if (error.response?.data != null) {
        try {
          return ApiErrorModel.fromJson(error.response!.data);
        } catch (_) {
          return _mapStatusCodeToFailure(statusCode);
        }
      } else {
        return _mapStatusCodeToFailure(statusCode);
      }
    case DioExceptionType.unknown:
    case DioExceptionType.badCertificate:
    default:
      return DataSource.defaultError.getFailure();
  }
}

ApiErrorModel _mapStatusCodeToFailure(int statusCode) {
  switch (statusCode) {
    case ResponseCode.badRequest:
      return DataSource.badRequest.getFailure();
    case ResponseCode.unauthorized:
      return DataSource.unauthorized.getFailure();
    case ResponseCode.forbidden:
      return DataSource.forbidden.getFailure();
    case ResponseCode.notFound:
      return DataSource.notFound.getFailure();
    case ResponseCode.internalServerError:
      return DataSource.internalServerError.getFailure();
    case ResponseCode.noContent:
      return DataSource.noContent.getFailure();
    default:
      return DataSource.defaultError.getFailure();
  }
}

class ApiInternalStatus {
  static const success = 0;
  static const failure = 1;
}
