import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/routing/routes.dart';
import 'package:phone_pe_demo/ui/screens/checkout.dart';
import 'package:phone_pe_demo/ui/screens/payment_failure.dart';
import 'package:phone_pe_demo/ui/screens/payment_success.dart';

class PageRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.checkoutScreen:
        return MaterialPageRoute(builder: (context) => CheckoutScreen());
      case Routes.paymentSuccessful:
        return MaterialPageRoute(builder: (context) => PaymentSuccessful());
      case Routes.paymentFailed:
        return MaterialPageRoute(builder: (context) => PaymentFailed());
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("No Page exists..."));
    }
  }
}
