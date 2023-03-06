import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';

class PhotoDataSource {
  final Http _http;

  PhotoDataSource({required Http http}) : _http = http;

  Future<Result<List<Photo>>> photos(Pagination pagination) async {
    return _http
        .get('/photos?_page=${pagination.offset}&_limit=${pagination.limit}')
        .resultList((json) {
      return json.map((e) => Photo.fromJson(e)).toList();
    });
  }
}
