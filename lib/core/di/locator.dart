
import 'package:get_it/get_it.dart';
import 'package:phone_pe_demo/core/view_models/checkout_view_model.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => CheckoutViewModel());
}
