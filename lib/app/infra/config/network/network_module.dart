import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../infra.dart';

abstract class NetworkModule {
  static List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => Http()),
      ];
}
