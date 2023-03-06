import 'package:dio/dio.dart';

abstract class Failure {
  Failure._();

  factory Failure.dioFailure(DioError error) = DioFailure;
  factory Failure.unknownFailure(TypeError error) = UnknownFailure;

  String get code;

  String get message;

  dynamic get response;
}

class DioFailure extends Failure {
  DioFailure(this.error) : super._();

  final DioError error;

  @override
  String get code => error.response?.statusCode.toString() ?? '';

  @override
  String get message => 'default_error_message';

  @override
  dynamic get response => error.response;
}

class UnknownFailure extends Failure {
  UnknownFailure(this.error) : super._();

  final TypeError error;

  @override
  String get code => error.hashCode.toString();

  @override
  String get message => 'default_error_message';

  @override
  dynamic get response => error;
}
