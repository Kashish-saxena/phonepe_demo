import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/di/locator.dart';
import 'package:phone_pe_demo/ui/screens/my_app.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

