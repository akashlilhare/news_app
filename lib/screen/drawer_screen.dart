import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/categori_model.dart';
import 'package:news_app/screen/privecy_police.dart';

import 'category_news.dart';
import 'home_screen.dart';

class DrawerScreen extends StatefulWidget {
  final List<CategoryModel> titleList;

  DrawerScreen({required this.titleList});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SafeArea(
        child: Column(
          children: [
            Container(
              //  color: Colors.blue.shade50,
              height: 70,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("In-",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900)),
                  Text(
                    "News",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              height: 1,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.titleList.length,
                  separatorBuilder: (c, i) {
                    return Divider();
                  },
                  itemBuilder: (c, i) {
                    var item = widget.titleList[i];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            //  color: Colors.blue,
                            height: 40,
                            width: 80,
                            child: i != widget.titleList.length - 1
                                ? CachedNetworkImage(
                                    width: double.infinity,
                                    height: 200,
                                    imageUrl: item.imageAssetUrl!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    // errorWidget: (context, url, error) => Icon(Icons.error),
                                  )
                                : Container(),
                          ),
                        ),
                        title: Padding(
                            padding: i != widget.titleList.length - 1
                                ? EdgeInsets.only(left: 16.0)
                                : EdgeInsets.only(left: 0.0),
                            child: i != widget.titleList.length - 1
                                ? Text(
                                    item.categoryName!,
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                                  )
                                : Container(
                                    height: 50,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Privacy Policy",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        // Text(
                                        //   "About",
                                        //   style: TextStyle(
                                        //       fontSize: 18,
                                        //       fontWeight: FontWeight.w900),
                                        // ),
                                        // Text(
                                        //   " In-",
                                        //   style: TextStyle(
                                        //       fontSize: 18,
                                        //       color: Colors.blue.shade900,
                                        //       fontWeight: FontWeight.w700),
                                        // ),
                                        // Text(
                                        //   "News",
                                        //   style: TextStyle(
                                        //       fontSize: 18,
                                        //       color: Colors.green.shade700,
                                        //       fontWeight: FontWeight.w700),
                                        // )
                                      ],
                                    ),
                                  )),
                        onTap: () {
                          if (i == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else if (i < widget.titleList.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryNewsScreen(
                                        category:
                                            widget.titleList[i].categoryName)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrivacyPolicy()));
                          }
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
