import '../../../infra/infra.dart';
import '../../domain_layer.dart';

class PhotoUseCase {
  final PhotoRepositoryInterface _repository;

  PhotoUseCase({
    required PhotoRepositoryInterface repository,
  }) : _repository = repository;

  Future<Result<Photo>> call() async {
    return _repository.photos();
  }
}
