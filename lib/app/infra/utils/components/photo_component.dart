import 'package:flutter/material.dart';

import '../../../domain_layer/domain_layer.dart';
import '../../infra.dart';

class PhotoComponent extends StatelessWidget {
  const PhotoComponent({
    super.key,
    required this.photo,
    required this.isSelected,
    required this.onPressed,
  });
  final Photo photo;
  final bool isSelected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue : Colors.white,
      child: ListTile(
        onTap: onPressed,
        title: Text(photo.title),
        leading: CustomImageLoadable(
          imageUrl: photo.thumbnailUrl,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}
