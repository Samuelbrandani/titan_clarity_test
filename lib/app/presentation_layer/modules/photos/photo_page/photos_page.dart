import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../infra/infra.dart';
import '../cubit/photos_cubit.dart';
import '../cubit/photos_state.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  late PhotosCubit _cubit;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get()..photos(loadMore: false);
    _scrollController = ScrollController()..addListener(scrollListener);
  }

  void scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _cubit.pagination.canLoadMore &&
        !_cubit.state.isLoading) {
      _cubit.photos(loadMore: true);
    }
  }

  @override
  Widget build(BuildContext _) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${state.selectedPhotos.length} photos selected'),
            actions: state.selectedPhotos.isNotEmpty
                ? [
                    IconButton(
                      onPressed: () {
                        Modular.to.pushNamed(
                          'favorite_photos',
                          arguments: state.selectedPhotos,
                        );
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {
                        _cubit.clearSelectedPhotos();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ]
                : [],
          ),
          body: ListView.separated(
            controller: _scrollController,
            itemCount: state.photos.length,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            itemBuilder: (_, index) {
              var photo = state.photos[index];
              return PhotoComponent(
                photo: photo,
                isSelected: state.selectedPhotos.contains(photo),
                onPressed: () {
                  _cubit.selectPhoto(photo);
                  setState(() {});
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
