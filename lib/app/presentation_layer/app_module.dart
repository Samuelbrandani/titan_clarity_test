import 'package:flutter_modular/flutter_modular.dart';

import '../infra/infra.dart';
import 'modules/modules.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...NetworkModule.binds,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: PhotosModule()),
  ];
}
