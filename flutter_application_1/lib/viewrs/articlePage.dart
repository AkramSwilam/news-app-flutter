import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  String url;
  String title;
  ArticlePage({Key? key,  required this.url, required this.title}) : super(key: key) ;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height.h,
        width: MediaQuery.of(context).size.width.w,
      child:WebView(
        initialUrl:widget.url ,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller){
          _controller.complete(controller);
        },
      )
    ),
    );
  }
}