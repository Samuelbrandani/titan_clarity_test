import '../../../domain_layer/domain_layer.dart';
import '../../../infra/infra.dart';
import '../../data_layer.dart';

class PhotoRepository implements PhotoRepositoryInterface {
  final PhotoDataSource _routesDataSource;

  PhotoRepository({
    required PhotoDataSource routesDataSource,
  }) : _routesDataSource = routesDataSource;

  @override
  Future<Result<Photo>> photos() async {
    return _routesDataSource.photos();
  }
}
