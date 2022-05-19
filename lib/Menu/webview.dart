import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
   late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  SafeArea(
        child: WebView(
          initialUrl:'https://www.amazon.com/',
          onWebViewCreated: (controller){
            this.controller = controller;
          },
          ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back,size: 32),
        onPressed: ()  {
         Navigator.pop(context);
        },
        ),
    );
    
  }
}