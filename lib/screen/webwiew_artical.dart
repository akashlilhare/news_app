

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer({@required this.url});
  @override
  createState() => _WebViewContainerState(this.url);
}


class _WebViewContainerState extends State < WebViewContainer > {
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState( this._url);
  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(   title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("In-",style: TextStyle(color: Colors.blue.shade900)),
            Text(
              "News",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),),
        body: IndexedStack(
          index: _stackToView,
          children: [
            Column(
              children: < Widget > [
                Expanded(
                    child: WebView(
                      key: _key,
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: _url,
                      onPageFinished: _handleLoad,
                    )
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        )
    );
  }
}


