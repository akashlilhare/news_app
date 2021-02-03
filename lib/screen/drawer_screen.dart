

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/categori_model.dart';

import 'category_news.dart';
import 'home_screen.dart';

class DrawerScreen extends StatefulWidget {

  final List<CategoryModel> titleList;


   DrawerScreen({@required this.titleList});

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
height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("In-",
                      style: TextStyle(fontSize:20,fontWeight:FontWeight.w500,color: Colors.blue.shade900)),
                  Text(
                    "News",
                    style: TextStyle(fontSize:20,fontWeight:FontWeight.w500,color: Colors.green),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(itemCount: widget.titleList.length,itemBuilder:(c,i){
                var item = widget.titleList[i];
                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 40,
                          width: 40,
                          child: Image.network(item.imageAssetUrl)),
                      title: Text(item.categoryName),
                      onTap: () {
                        if(i ==0){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Home()));

                        }else if(i == widget.titleList.length-1){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Home()));

                        }else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryNewsScreen(
                                        category:
                                        item.categoryName,
                                      )));
                        }

                      },
                    ),
                    Divider()
                  ],
                );
              }),
            ),
            ListTile(leading: Icon(Icons.info),title: Text("About app"),)

          ],
        ),
      ),
    );
  }
}
