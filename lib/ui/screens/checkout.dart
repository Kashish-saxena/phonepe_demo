import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/constants/color_constants.dart';
import 'package:phone_pe_demo/core/constants/image_constants.dart';
import 'package:phone_pe_demo/core/constants/string_constants.dart';
import 'package:phone_pe_demo/core/view_models/checkout_view_model.dart';
import 'package:phone_pe_demo/ui/screens/base_view.dart';
import 'package:phone_pe_demo/ui/widgets/item_container.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  CheckoutViewModel? model;
  @override
  Widget build(BuildContext context) {
    return BaseView<CheckoutViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
                child: buildAppBar()),
            body: buildBody(context),
          ),
        );
      },
    );
  }

  Widget buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          const Text(
            "Checkout",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
    );
  }

  Widget buildBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SingleChildScrollView(
          child: Column(
            children: [
              ItemContainer(
                itemName: StringConstants.modernChair,
                itemImage: ImageConstants.sofa,
              ),
              ItemContainer(
                itemName: StringConstants.vintageChair,
                itemImage: ImageConstants.chair,
              ),
            ],
          ),
        ),
        Container(
          padding:
              const EdgeInsetsDirectional.only(top: 40, end: 30, start: 30),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: ColorConstants.whiteFAFAFA,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 1,
                  color: ColorConstants.grey,
                  offset: Offset(0, 4))
            ],
          ),
          child: Column(
            children: [
              buildItemDescription(
                  title: StringConstants.total, price: StringConstants.rupees200),
              buildItemDescription(
                  title: StringConstants.shippingFee,
                  price: StringConstants.rupees10),
              const Divider(
                color: ColorConstants.grey,
              ),
              buildItemDescription(
                  title: StringConstants.subTotal,
                  price: StringConstants.rupees210,
                  titleStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                  priceStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                    ),
                    onPressed: (){model?.startTransaction(model?.callBackUrl, model?.packageName,context);},
                    child: const Text(
                      StringConstants.payNow,
                      style: TextStyle(
                          color: ColorConstants.whiteFAFAFA, fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildItemDescription(
      {String? title,
      String? price,
      TextStyle? titleStyle =
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      TextStyle? priceStyle =
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: titleStyle,
        ),
        Text(
          price ?? "",
          style: priceStyle,
        ),
      ],
    );
  }
}
