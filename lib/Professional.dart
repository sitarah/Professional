import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(

            body: WebViewClass()
        )
    );
  }
}

class WebViewClass extends StatefulWidget {

  WebViewState createState() => WebViewState();

}

class WebViewState extends State<WebViewClass>{

  int position = 1 ;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A){
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
            index: position,
            children: <Widget>[

              WebView(
                initialUrl: 'https://www.prowindowfilms.com',
                javascriptMode: JavascriptMode.unrestricted,
                key: key ,
                onPageFinished: doneLoading,
                onPageStarted: startLoading,
              ),

              Container(
                color: Colors.white,
                child: Center(
                    child: CircularProgressIndicator()),
              ),

            ])
    );
  }
}