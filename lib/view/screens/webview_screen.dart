import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewExample extends StatefulWidget {

  final String url;

  const WebViewExample({Key key, this.url}) : super(key: key);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  // void initState() {
  //   super.initState();
  //   // Enable hybrid composition.
  //   if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  // }

  @override
  Widget build(BuildContext context) {
    print("URL :"+widget.url.toString());
    return WebviewScaffold(
      url: widget.url,
    //  javascriptChannels: jsChannels,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: const Text('Widget WebView'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      // initialChild: Container(
      //   color: Colors.redAccent,
      //   child: const Center(
      //     child: Text('Waiting.....'),
      //   ),
      // ),
    );
  }
  }
