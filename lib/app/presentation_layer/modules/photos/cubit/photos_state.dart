import 'package:equatable/equatable.dart';

class PhotosState extends Equatable {
  final bool isLoading;
  final String currentRoute;

  const PhotosState({
    this.isLoading = false,
    this.currentRoute = '',
  });

  PhotosState copyWith({
    bool? isLoading,
    String? currentRoute,
  }) {
    return PhotosState(
      isLoading: isLoading ?? this.isLoading,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        currentRoute,
      ];
}
