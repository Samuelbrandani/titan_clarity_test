import 'package:equatable/equatable.dart';

import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';

class PhotosState extends Equatable {
  final bool isLoading;
  final Failure? error;
  final List<Photo> photos;

  const PhotosState({
    this.isLoading = false,
    this.error,
    this.photos = const [],
  });

  PhotosState copyWith({
    bool? isLoading,
    Failure? error,
    List<Photo>? photos,
  }) {
    return PhotosState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      photos: photos ?? this.photos,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        photos,
      ];
}
