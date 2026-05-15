

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  WebViewContainer({required this.url});
  @override
  createState() => _WebViewContainerState();
}


class _WebViewContainerState extends State < WebViewContainer > {
  final _key = UniqueKey();
  int _stackToView = 1;

  void _handleLoad(String value) {
    if (!mounted) {
      return;
    }

    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
           Text("News App",style: TextStyle(color: Colors.white,fontSize: 20),),
          backgroundColor: Colors.blue.shade900,

        ),
        body: IndexedStack(
          index: _stackToView,
          children: [
            Column(
              children: <Widget>[
                Expanded(

                    child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.url,
                  onPageFinished: _handleLoad,
                    )
                ),
              ],
            ),
            Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        )
    );
  }
}


