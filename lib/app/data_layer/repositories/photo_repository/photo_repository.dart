import '../../../domain_layer/domain_layer.dart';
import '../../../infra/infra.dart';
import '../../data_layer.dart';

class PhotoRepository implements PhotoRepositoryInterface {
  final PhotoDataSource _dataSource;

  PhotoRepository({
    required PhotoDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Result<List<Photo>>> photos(Pagination pagination) async {
    return _dataSource.photos(pagination);
  }
}
