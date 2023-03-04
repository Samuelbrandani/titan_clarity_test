import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';

class PhotoDataSource {
  final Http _http;

  PhotoDataSource({required Http http}) : _http = http;

  Future<Result<Photo>> photos() async {
    return _http.get('/photos').result((json) => Photo.fromJson(json));
  }
}
