import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/routing/routes.dart';
import 'package:phone_pe_demo/core/view_models/base_model.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class CheckoutViewModel extends BaseModel {
  Object? result;
  String environmentValue = 'SANDBOX';
  String appId = "";
  String callBackUrl =
      "https://webhook.site/18b97022-5593-4007-8853-a0db128b43dc";
  String merchantId = "PGTESTPAYUAT";
  bool enableLog = true;
  String packageName = "com.example.phone_pe_demo";
  void phonepeInit() {
    PhonePePaymentSdk.init(environmentValue, appId, merchantId, enableLog)
        .then((val) {
      result = 'PhonePe SDK Initialized - $val';
      updateUI();
    }).catchError((error) {
      handleError(error);
    });
  }

  startTransaction(callbackUrl, packageName,context) async {
    phonepeInit();
    final data = {
      "merchantId": merchantId,
      "merchantTransactionId": "MT${getRandomNumber()}",
      "merchantUserId": "MU${getRandomNumber()}",
      "amount": 100,
      "callbackUrl":
          "https://webhook.site/18b97022-5593-4007-8853-a0db128b43dc",
      "mobileNumber": "7011134385",
      "paymentInstrument": {
        "type": "PAY_PAGE",
      }
    };
    String jsonString = jsonEncode(data);
    const saltkey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
    const apiEndPoint = "/pg/v1/pay";
    const saltIndex = "1";
    String base64Data = jsonString.toBase64;
    String dataToHash = base64Data + apiEndPoint + saltkey;
    String sHA256 = generateSha256Hash(dataToHash);

    debugPrint(base64Data);
    debugPrint('#' * 10);
    debugPrint("$sHA256###$saltIndex");
    String body = base64Data;
    String checksum = "$sHA256###$saltIndex";

    debugPrint("body>>>>>$body");
    debugPrint("checksum>>>>>$checksum");

    try {
      PhonePePaymentSdk.startTransaction(
              body, callbackUrl, checksum, packageName)
          .then((response) {
        if (response != null) {
          String status = response['status'].toString();
          String error = response['error'].toString();
          if (status == 'SUCCESS') {
            result = "Flow Completed - Status: Success!";
         Navigator.popAndPushNamed(context, Routes.paymentSuccessful);
          } else {
            result = "Flow Completed - Status: $status and Error: $error";
            Navigator.popAndPushNamed(context, Routes.paymentFailed);
            updateUI();
          }
        } else {
          result = "Flow Incomplete";
          updateUI();
        }
      }).catchError((error) {
        handleError(error);
      });
    } catch (error) {
      handleError(error);
    }
  }

  String generateSha256Hash(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  String getRandomNumber() {
    Random random = Random();
    String randomMerchant = "";
    for (int i = 0; i < 15; i++) {
      randomMerchant += random.nextInt(10).toString();
    }
    debugPrint("random Merchant>>>>> $randomMerchant");
    return randomMerchant;
  }

  void handleError(error) {
    if (error is Exception) {
      result = error.toString();
      updateUI();
    } else {
      result = {"error": error};
      updateUI();
    }
  }
}

extension EncodingExtensions on String {
  /// To Base64
  /// This is used to convert the string to base64
  String get toBase64 {
    return base64.encode(toUtf8);
  }

  /// To Utf8
  /// This is used to convert the string to utf8
  List<int> get toUtf8 {
    return utf8.encode(this);
  }

  /// To Sha256
  /// This is used to convert the string to sha256
  String get toSha256 {
    return sha256.convert(toUtf8).toString();
  }
}
