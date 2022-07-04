import 'package:flutter/material.dart';
import 'package:shoryu_dev/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    final webView = WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: url,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: appBrand,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: appBrand,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: webView,
    );
  }
}
