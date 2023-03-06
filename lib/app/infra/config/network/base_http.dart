import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseHttp extends DioForNative {
  BaseHttp() {
    options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}

class Http extends BaseHttp {
  Http() : super();

  @override
  BaseOptions get options {
    return BaseOptions(
      baseUrl: dotenv.env['BASES_URL'] ?? '',
    );
  }
}
