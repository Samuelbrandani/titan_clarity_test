import 'package:flutter/material.dart';

import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/utils/utils.dart';

class FavoritePhotosPage extends StatefulWidget {
  const FavoritePhotosPage({super.key, required this.listPhotos});
  final List<Photo> listPhotos;
  @override
  State<FavoritePhotosPage> createState() => _FavoritePhotosPageState();
}

class _FavoritePhotosPageState extends State<FavoritePhotosPage> {
  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites Photos')),
      body: ListView.builder(
        itemCount: widget.listPhotos.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var photo = widget.listPhotos[index];
          return PhotoComponent(
            photo: photo,
            isSelected: false,
            onPressed: () => callPhotoDetails(context, photo),
          );
        },
      ),
    );
  }

  void callPhotoDetails(BuildContext context, Photo photo) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageLoadable(
                  imageUrl: photo.url,
                  width: 200,
                  height: 200,
                ),
                Text(photo.title),
                const SizedBox(height: 40)
              ],
            ),
          ),
        );
      },
    );
  }
}
