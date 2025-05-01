import 'api_error_handler.dart.dart';
import 'api_error_model.dart';

class ApiNetworkExceptions {
  static ApiErrorModel getDioException(dynamic error) {
    if (error is ApiErrorModel) {
      return error;
    }
    return ErrorHandler.handle(error).apiErrorModel;
  }

  static String getErrorMessage(ApiErrorModel error) {
    if (error.errors != null && error.errors!.isNotEmpty) {
      return error.errors!.join('\n');
    }
    return error.message ?? "An unexpected error occurred";
  }

  static String getErrorFromException(dynamic exception) {
    if (exception is String) return exception;
    if (exception is ApiErrorModel) return getErrorMessage(exception);
    return getErrorMessage(getDioException(exception));
  }
}
