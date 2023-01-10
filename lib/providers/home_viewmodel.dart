// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

class HomeViewModel extends BaseViewModel {
  // String? otp;
  // // final TextEditingController otpController = TextEditingController();
  // bool? isRegistering;
  // bool _otpIsComplete = false;
  //
  // void onPinCompleted(String value) {
  //   otp = value;
  //   notifyListeners();
  // }
  // void onOTPEntered(String pin) {
  //   print("Changed: " + pin);
  //   _otpIsComplete = pin.length == 6;
  //   notifyListeners();
  // }
  Future<void> readData() async {
    // try{
      var data = await rootBundle.loadString('assets/sample.json');
      log(data);
    // }catch(e){
    //   log('Error: $e');
    // }
  }
}

// otp_text_field/otp_text_field