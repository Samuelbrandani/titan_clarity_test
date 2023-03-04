import 'package:flutter_bloc/flutter_bloc.dart';

import 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(const PhotosState());

  Future<void> getPhotos() async {}
}
