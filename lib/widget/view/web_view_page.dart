import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ncov_2019/commom/commom.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() => new WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      new Completer<WebViewController>();
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new ComMomBar(title: widget.title ?? ''),
      body: new WillPopScope(
        child: new Builder(builder: (BuildContext context) {
          return new WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              _webViewController = webViewController;
            },
            javascriptChannels: <JavascriptChannel>[
              _toasterJavascriptChannel(context),
            ].toSet(),
            navigationDelegate: (NavigationRequest request) {
              if (request.url
                  .startsWith('https://github.com/ahyangnb/ncov_2019')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
          );
        }),
        onWillPop: () => pop(),
      ),
    );
  }

  Future<bool> pop() async {
    bool canGoBack = await _webViewController.canGoBack();

    if (canGoBack) {
      _webViewController.goBack();

      return false;
    } else {
      return true;
    }
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return new JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          new SnackBar(content: Text(message.message)),
        );
      },
    );
  }
}
