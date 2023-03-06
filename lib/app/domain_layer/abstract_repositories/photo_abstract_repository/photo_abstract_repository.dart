import '../../../infra/infra.dart';
import '../../domain_layer.dart';

abstract class PhotoRepositoryInterface {
  Future<Result<List<Photo>>> photos(Pagination pagination);
}
