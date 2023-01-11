// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:graph_implementation/models/graph_data_model.dart';

class HomeViewModel extends BaseViewModel {
  List<GraphData> graphDataList = [];
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
      var data = await rootBundle.loadString('asset/json_file/sample.json');
      var result = json.decode(data);
      graphDataList = result.map<GraphData>((value)=> GraphData.fromJson(value)).toList();
      log('${graphDataList[0]}');
      notifyListeners();
    // }catch(e){
    //   log('Error: $e');
    // }
  }
}

// otp_text_field/otp_text_field