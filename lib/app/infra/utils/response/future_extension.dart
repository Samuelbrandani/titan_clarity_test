// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart' show Response, DioError;

import '../../infra.dart';

extension FutureExtension on Future<Response> {
  Future<Result<R>> result<R>(
    R Function(Map<String, dynamic> json) onValue,
  ) async {
    try {
      var response = await this;
      Map<String, dynamic> encodedData = response.data;
      return Result.success(onValue(encodedData));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
    } on TypeError catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }

  Future<Result<R>> resultList<R>(
    R Function(List<dynamic> json) onValue,
  ) async {
    try {
      var response = await this;
      List<dynamic> encodedData = response.data;
      return Result.success(onValue(encodedData));
    } on DioError catch (e) {
      return Result.error(Failure.dioFailure(e));
    } on TypeError catch (e) {
      return Result.error(Failure.unknownFailure(e));
    }
  }
}
