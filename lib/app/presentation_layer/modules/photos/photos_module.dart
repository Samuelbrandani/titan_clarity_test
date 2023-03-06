import 'package:flutter_modular/flutter_modular.dart';

import '../../../data_layer/data_layer.dart';
import '../../../domain_layer/domain_layer.dart';
import 'cubit/photos_cubit.dart';
import 'favorite_photos/favorite_photos_page.dart';
import 'photo_page/photos_page.dart';

class PhotosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PhotosCubit(i())),
    Bind.lazySingleton((i) => PhotoRepository(dataSource: i())),
    Bind.lazySingleton((i) => PhotoUseCase(repository: i())),
    Bind.lazySingleton((i) => PhotoDataSource(http: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const PhotosPage(),
    ),
    ChildRoute(
      '/favorite_photos',
      child: (context, args) => FavoritePhotosPage(listPhotos: args.data),
    ),
  ];
}
