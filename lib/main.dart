import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Now',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, primarySwatch: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "Now",
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
      ),
      body: Container(child: CategoryTile()),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [Image.network(imageUrl, width: 120, height: 60,),],
    ));
  }
}
