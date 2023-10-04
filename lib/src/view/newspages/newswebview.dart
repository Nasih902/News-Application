import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// ignore: must_be_immutable
class NewsWebview extends StatefulWidget {
  String url;
  NewsWebview({super.key, required this.url});

  @override
  State<NewsWebview> createState() => _NewsWebviewState();
}

class _NewsWebviewState extends State<NewsWebview> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
    );
  }
}
