import 'package:flutter/material.dart';
import 'images.dart';
import 'imageItem.dart';

class ImageList extends StatelessWidget {
  final List<Images> items;

  ImageList({Key? key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ImageItem(item: items[index]);
      },
    );
  }
}
