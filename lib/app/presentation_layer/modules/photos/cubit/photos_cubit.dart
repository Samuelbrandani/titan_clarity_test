import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';
import 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit(
    this._usecase,
  ) : super(const PhotosState());
  final PhotoUseCase _usecase;
  var pagination = const Pagination(limit: 20);

  Future<void> photos({bool? loadMore = false}) async {
    emit(state.copyWith(isLoading: true, error: null));

    var newPage = pagination.paginate(loadMore: loadMore ?? false);

    (await _usecase(newPage)).result(
      (data) {
        var photos = [
          if (!newPage.firstPage) ...state.photos,
          ...data,
        ];

        emit(state.copyWith(isLoading: false, photos: photos));

        pagination = newPage.refreshCanLoadMore(loadedCount: data.length);
      },
      (error) {
        emit(state.copyWith(
          isLoading: false,
          error: error,
        ));
      },
    );
  }
}
