import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({@required this.blogUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  var _completer = Completer();
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
            ),
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl:widget.blogUrl,
          onWebViewCreated: ((controller){
            _completer.complete(controller);
          }),
        ),
      ),
    );
  }
}

