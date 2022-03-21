import 'package:flutter/material.dart';
import 'images.dart';

class ImageItem extends StatelessWidget {
  ImageItem({required this.item});

  final Images item;


  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  this.item.imageHref,
                  width: 200,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.description,
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        )))
              ]),
        ));
  }
}
