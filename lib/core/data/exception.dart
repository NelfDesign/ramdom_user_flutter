abstract class BaseException implements Exception {
  const BaseException({this.message});

  final String? message;

  @override
  String toString() {
    return message == null ? runtimeType.toString() : '${runtimeType.toString()}: $message';
  }
}

class ApiException extends BaseException {
  ApiException({
    required this.method,
    required this.path,
    this.data,
    this.statusCode = 500,
    this.error,
  }) : super(
          message: '''
Error while calling ${method.toUpperCase()} -> '$path': response status: $statusCode''',
        );

  final String method;
  final String path;
  final dynamic data;
  final int statusCode;
  final dynamic error;
}
