import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView(

      children: [
        SizedBox(height: 12,),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  margin: EdgeInsets.only(left: 12, right: 12,bottom: 12),
                  height: height*.45,
                  width: 300,
             ),

              );
            }),
      ],
    );
  }
}
