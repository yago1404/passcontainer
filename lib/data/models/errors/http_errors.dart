interface class HttpError {
  late int statusCode;
  late String message;
}

class UnauthorizedError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  UnauthorizedError({required this.statusCode, required this.message});
}

class NotFoundError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  NotFoundError({required this.statusCode, required this.message});
}

class BadRequestError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  BadRequestError({required this.statusCode, required this.message});
}

class InternalServerError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  InternalServerError({required this.statusCode, required this.message});
}

class ForbiddenError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  ForbiddenError({required this.statusCode, required this.message});
}

class ConflictError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  ConflictError({required this.statusCode, required this.message});
}

class GatewayTimeoutError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  GatewayTimeoutError({required this.statusCode, required this.message});
}

class ServiceUnavailableError implements HttpError {
  @override
  int statusCode;
  @override
  String message;

  ServiceUnavailableError({required this.statusCode, required this.message});
}
