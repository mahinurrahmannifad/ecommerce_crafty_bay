import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.paymentAmount});

  static const String name = '/payment';
  final double paymentAmount;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _webViewController;

  void _placeOrder() {}

  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Payment Failed'),
          content: const Column(
            children: [Text('Your payment has been failed! Please try again')],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _webViewController =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(onProgress: (int progress) {},
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
              print(request.url);
              if (request.url.startsWith('success-url')) {
                _placeOrder();
              } else if (request.url.startsWith('failed-url')) {
                _showFailureDialog();
              }
              return NavigationDecision.navigate;
              },
            ),
          )
    ..loadRequest(Uri.parse('https://sandbox.sslcommerz.com?total_amount=${widget.paymentAmount}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
