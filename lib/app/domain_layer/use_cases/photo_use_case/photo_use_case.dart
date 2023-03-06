import '../../../infra/infra.dart';
import '../../domain_layer.dart';

class PhotoUseCase {
  final PhotoRepositoryInterface _repository;

  PhotoUseCase({
    required PhotoRepositoryInterface repository,
  }) : _repository = repository;

  Future<Result<List<Photo>>> call(Pagination pagination) async {
    return _repository.photos(pagination);
  }
}
