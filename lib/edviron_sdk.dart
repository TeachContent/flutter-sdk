library edviron_sdk;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


enum EdvironMode {
  production,
  development,
}

// ignore: must_be_immutable
class Edviron extends StatelessWidget{
  final controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);
  EdvironMode mode = EdvironMode.production;
  Edviron({super.key, this.mode = EdvironMode.production});

  @override
  Widget build(BuildContext context) {
    context = context;
    return Container();
  }
  

  void collect({
    required BuildContext context,
    required String collectRequestId,
    required void Function() onSuccess,
    required void Function() onError,
  }) {
    controller.setNavigationDelegate(NavigationDelegate(
    onNavigationRequest: (request) {
      if(request.url.contains('pg.edviron.com/payment-success')) {
        onSuccess();
        Navigator.of(context).pop();
      } else if(request.url.contains('pg.edviron.com/payment-failure')) {
        onError();
        Navigator.of(context).pop();
      }
      return NavigationDecision.navigate;
    }));
    String prefix = mode == EdvironMode.production ? 'pg' : 'dev.pg';
    controller.loadRequest(Uri.parse('https://$prefix.edviron.com/collect-sdk-payments?collect_id=$collectRequestId'));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

        body: WebViewWidget(controller: controller),
      )
    ));
  }
}


