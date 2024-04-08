import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/di/locator.dart';
import 'package:phone_pe_demo/core/routing/router.dart';
import 'package:phone_pe_demo/core/routing/routes.dart';
import 'package:phone_pe_demo/core/view_models/checkout_view_model.dart';
import 'package:phone_pe_demo/ui/screens/checkout.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CheckoutViewModel>(
            create: (context) => CheckoutViewModel())
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: Routes.checkoutScreen,
          onGenerateRoute: (settings) => PageRoutes.generateRoutes(settings),
        );
      },
    );
  }
}
