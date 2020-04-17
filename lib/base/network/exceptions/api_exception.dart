import 'dart:io';

class ApiException extends IOException {
  final String code;
  final String printableMessage;
  final String developerMessage;

  ApiException(this.code, this.printableMessage, this.developerMessage);
}

class WrongCredentialsException extends ApiException {
  WrongCredentialsException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class NotFoundException extends ApiException {
  NotFoundException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class DefaultException extends ApiException {
  DefaultException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class InternalServerException extends ApiException {
  InternalServerException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class BadValidationException extends ApiException {
  BadValidationException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class UnknownErrorException extends ApiException {
  UnknownErrorException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class ServerNotReachableException extends ApiException {
  ServerNotReachableException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class ConnectivityException extends ApiException {
  ConnectivityException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class EmptyBodyException extends ApiException {
  EmptyBodyException(String code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}
