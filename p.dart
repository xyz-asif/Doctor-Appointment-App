import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
     print("failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(child: const Text("pay now"),onPressed: () {
        var options = {
  'key': 'rzp_test_klRXFR55I5q4MN',
  'amount': 50000,
  'name': 'Asif Shaik',
  'description': 'Token',
  'prefill': {
    'contact': '8888888888',
    'email': 'connectasifshaik@gmail.com'
  }
};
        _razorpay.open(options);
      },)),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
