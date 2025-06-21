import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({super.key});

  WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse('https://tanklove.tistory.com'))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Code Factory',
          style: TextStyle(
            color: Color(0xFF241415),
            fontSize: 22,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
