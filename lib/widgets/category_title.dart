import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
       // color: Colors.green.shade100,
        margin: EdgeInsets.only(right: 10),
          child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
           child: CachedNetworkImage(
             width: 120,
              height: 60,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
             // errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // child:CachedNetworkImage(
            //   imageUrl:
            //     imageUrl(
            //       imageUrl:imageUrl,
            //     width: 120,
            //     height: 60,
            //     fit: BoxFit.cover,
            //   ),
            // )

          ),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black26

            ),
          ),
          Text(categoryName,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ],
      )),
    );
  }
}
