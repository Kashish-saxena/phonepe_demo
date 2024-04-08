import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/constants/color_constants.dart';
import 'package:phone_pe_demo/core/constants/string_constants.dart';
import 'package:phone_pe_demo/core/routing/routes.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }
  Widget buildBody(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: ColorConstants.green,
              
            ),
            child: const Icon(Icons.done,color: ColorConstants.whiteFAFAFA,size:40)),
          const Text(
          StringConstants.orderConfirmed,style: TextStyle(color: ColorConstants.green,fontSize: 24),),
         const SizedBox(height: 20,),
          ElevatedButton(
            style:ElevatedButton.styleFrom(
              
              padding: const EdgeInsets.symmetric(horizontal: 40),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: ColorConstants.black,
            ),
              onPressed: () {
                Navigator.popAndPushNamed(context, Routes.checkoutScreen);
              },
              child: const Text(StringConstants.goToCart,style: TextStyle(color: ColorConstants.whiteFAFAFA),)),
        ],
      ),
    );
  }
}