import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter InAppWebView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: WebUri.uri(Uri.parse("https://introme.co.kr/"))),
          // url: WebUri.uri(Uri.parse("http://172.30.1.10:3000"))),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (controller, url) {
            print("Started loading: $url");
          },
          onLoadStop: (controller, url) async {
            print("Finished loading: $url");
          },
        ),
      ),
    );
  }
}
