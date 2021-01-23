import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
        margin: EdgeInsets.only(right: isPortrait ? 10 : 20),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: isPortrait ? height * .18 : height * .33,
                  height: isPortrait ? height * .09 : height * .15,
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: isPortrait ? height * .18 : height * .33,
                height: isPortrait ? height * .09 : height * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black26),
              ),
            ),
            Positioned(
              top: 10,
                left: 20,
                child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ],
        ));
  }
}
