import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/photos_cubit.dart';
import 'photos_page.dart';

class PhotosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PhotosCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const PhotosPage(),
    ),
  ];
}
