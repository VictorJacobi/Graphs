// import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:graph_implementation/ui/home_screen.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';
import 'package:graph_implementation/models/graph_data_model.dart';

///We have two functions - retrieved data(Mike's flow) and the sent data for processing (my flow)


///To work with dart multithreading(Isolates) you need 4 steps
///
/// The first is to link the isolates through both their send and receive port.
/// Note: the retrieved data sendPort(mike sendPort) is the sendPort from the sent data(my send port)
/// The Third is to assign the retrieved data receive port(mike receive port) in the send data for processing function
/// The you can send and receive data through the retrieved data(mike) send and receive port in both functions.
///And lastly when sending data from the sent data you need to always pass the retrieved data send port so It can know which port it should retrieve from.

Future<List<CategoryBarChartModel>?> myPort(List<GraphData> result,void Function(SendPort port) mikeDataEvaluated) async{

  ///The format t
  ReceivePort myReceivePort = ReceivePort();
  Isolate.spawn<SendPort>(mikeDataEvaluated, myReceivePort.sendPort);//Here I have linked the isolate successfully from my end.
  SendPort mikeSendPort = await myReceivePort.first;
  ReceivePort mikeReceivePort = ReceivePort();

  ///Right here I sent a message to mike.
  log('${result.length}');
  mikeSendPort.send({'message': result,'sendPort':mikeReceivePort.sendPort});
  await for (var message in mikeReceivePort){
    log('My message: ${message.take(2)}');
    return message as List<CategoryBarChartModel>;

  }
  return null;
}

void widowsAgeBereavementEvaluated(SendPort mySendPort) async {

  ReceivePort mikeReceivePort = ReceivePort();
  mySendPort.send(mikeReceivePort.sendPort);//So the sent data function can also know which send port it is.

  // SendPort mySendPort = mikeReceivePort.first;
  await for (var message in mikeReceivePort) {
    if (message is Map) {
      final myMessage = message['message'];
      // final coffeeType = message[1];
      // log('Message: ${myMessage.length}');

      /// Get Mike's response sendPort
      final SendPort mikeResponseSendPort = message['sendPort'];

      /// Send Mike's response via mikeResponseSendPort
      // List<CategoryBarChartModel> graphList = [];
      // log()
      // log('${myMessage.where((element) => element.).toList()}');
      List valueGotten = [];
      Set lgas = myMessage.map((e) => e.lga??'').toSet();
      // log('value gotten: ${valueGotten.length}');
      // log('lga length: ${lgas.length}');
      int index = 0;
      for(var lga in lgas){
        // log('$lga');
        bool hasValue = false;
        for(var value in myMessage){
          // log('${value.lga}\n $lga');

          if(lga.toString() == value.lga.toString() && !hasValue){
            // log('true');
            valueGotten.add(value);
            hasValue = true;
          }
        }
      }
      // log('value gotten: ${valueGotten.length}');

      mikeResponseSendPort.send(valueGotten.map<CategoryBarChartModel>((value) {
        return CategoryBarChartModel(category: value.lga??'', y: myMessage.where((element) => element.lga==value.lga).toList().toSet().length.toDouble());
      }).toList());
    }
  }
}
void occupationTypeEvaluated(SendPort mySendPort) async {

  ReceivePort mikeReceivePort = ReceivePort();
  mySendPort.send(mikeReceivePort.sendPort);
  await for (var message in mikeReceivePort) {
    if (message is Map) {
      final myMessage = message['message'];
      final SendPort mikeResponseSendPort = message['sendPort'];
      List valueGotten = [];
      Set occupations = myMessage.map((e) => e.occupationServicesType??'').toSet();
      for(var occupation in occupations){
        bool hasValue = false;
        for(var value in myMessage){
          if(occupation.toString() == value.occupationServicesType.toString() && !hasValue&&occupation.toString()!='What is your occupation'){
            // log('true');
            valueGotten.add(value);
            hasValue = true;
          }
        }
      }
      // log('value gotten: ${valueGotten.last}');

      mikeResponseSendPort.send(valueGotten.map<CategoryBarChartModel>((value) {
        return CategoryBarChartModel(category: value.occupationServicesType??'', y: myMessage.where((element) => element.occupationServicesType==value.occupationServicesType).toList().toSet().length.toDouble());
      }).toList());
    }
  }
}
void widowsAgeEvaluated(SendPort mySendPort) async {

  ReceivePort mikeReceivePort = ReceivePort();
  mySendPort.send(mikeReceivePort.sendPort);
  await for (var message in mikeReceivePort) {
    if (message is Map) {
      final myMessage = message['message'] as List<GraphData>;
      final SendPort mikeResponseSendPort = message['sendPort'];
      List<CategoryBarChartModel> valueGotten = [];
      // Set widowsAge = myMessage.map((e) => e.widowsAgeAtSpouseBereavement??'').toSet();
      // log('Widows age length: ${widowsAge}');
      // for(var widowAge in widowsAge){
      bool hasValue = false;
      for(WidowAgeStage stage in WidowAgeStage.values){
        if(stage==WidowAgeStage.lessThan20){
          valueGotten.add(CategoryBarChartModel(category: '<20', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!<20:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.twentyTo24){
          valueGotten.add(CategoryBarChartModel(category: '20-24', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>19&&element.widowsAgeAtSpouseBereavement!<25:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.twentyFiveTo29){
          valueGotten.add(CategoryBarChartModel(category: '25-29', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>24&&element.widowsAgeAtSpouseBereavement!<30:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.thirtyTo34){
          valueGotten.add(CategoryBarChartModel(category: '30-34', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>29&&element.widowsAgeAtSpouseBereavement!<35:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.thirtyFiveTo39){
          valueGotten.add(CategoryBarChartModel(category: '35-39', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>34&&element.widowsAgeAtSpouseBereavement!<40:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.fortyTo44){
          valueGotten.add(CategoryBarChartModel(category: '40-44', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>39&&element.widowsAgeAtSpouseBereavement!<45:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.fortyFiveTo49){
          valueGotten.add(CategoryBarChartModel(category: '45-49', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>44&&element.widowsAgeAtSpouseBereavement!<50:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.fiftyTo54){
          valueGotten.add(CategoryBarChartModel(category: '50-54', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>49&&element.widowsAgeAtSpouseBereavement!<55:false).toList().toSet().length.toDouble()));
        }else if(stage==WidowAgeStage.fiftyFiveTo59){
          valueGotten.add(CategoryBarChartModel(category: '55-59', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>54&&element.widowsAgeAtSpouseBereavement!<60:false).toList().toSet().length.toDouble()));
        }else{
          valueGotten.add(CategoryBarChartModel(category: '60+', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>59:false).toList().toSet().length.toDouble()));
        }

      }
      log('valueGotten: $valueGotten');
      // for(var value in myMessage){
      //     if(widowAge<20){
      // //       // log('true');
      //        //       hasValue = true;
      //     }
      // }
      // }
      // log('value gotten: ${valueGotten.last}');

      mikeResponseSendPort.send(valueGotten);
    }
  }
}

void yearsSpentAsWidow(SendPort mySendPort) async {

  ReceivePort mikeReceivePort = ReceivePort();
  mySendPort.send(mikeReceivePort.sendPort);
  await for (var message in mikeReceivePort) {
    if (message is Map) {
      final myMessage = message['message'] as List<GraphData>;
      final SendPort mikeResponseSendPort = message['sendPort'];
      List<CategoryBarChartModel> valueGotten = [];
      // Set widowsAge = myMessage.map((e) => e.widowsAgeAtSpouseBereavement??'').toSet();
      // log('Widows age length: ${widowsAge}');
      // for(var widowAge in widowsAge){
        bool hasValue = false;
        for(int i=0; i<21;i++){
         if(i<=20){
           valueGotten.add(CategoryBarChartModel(category: '$i', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!<=i:false).toList().toSet().length.toDouble()));
         }else{
           valueGotten.add(CategoryBarChartModel(category: '20+', y: myMessage.where((element) =>  element.widowsAgeAtSpouseBereavement!=null? element.widowsAgeAtSpouseBereavement!>=20:false).toList().toSet().length.toDouble()));
         }

        }
      log('valueGotten: $valueGotten');
        // for(var value in myMessage){
      //     if(widowAge<20){
      // //       // log('true');
      //        //       hasValue = true;
      //     }
        // }
      // }
      // log('value gotten: ${valueGotten.last}');

      mikeResponseSendPort.send(valueGotten);
    }
  }
}



class HomeViewModel extends BaseViewModel {
  bool loadPage = false;
  List<GraphData> graphDataList = [];
  List<CategoryBarChartModel> occupationTypeChartData = [];
  List<CategoryBarChartModel> yearsSpentAsWidowList = [];
  List<CategoryBarChartModel> widowsRegisteredChartData = [];
  List<CategoryBarChartModel> widowsAgeAtBereavementChartData = [];
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
    loadPage = true;
      var data = await rootBundle.loadString('asset/json_file/sample.json');
      var result = json.decode(data);
      graphDataList = await result.map<GraphData>((value)=> GraphData.fromJson(value)).toList();
      // chartData = await result.map<CategoryBarChartModel>((value) => CategoryBarChartModel(category: value['lga']??'', y: graphDataList.where((element) => element.lga==value['lga']).toList().length.toDouble())).toList();
      // log('chartDataLength: ${chartData[0].y}');

      // log('${graphDataList[0]}');
    widowsRegisteredChartData = await myPort(graphDataList,widowsAgeBereavementEvaluated)??[];
    occupationTypeChartData = await myPort(graphDataList,occupationTypeEvaluated)??[];
    // yearsSpentAsWidowList = await myPort(graphDataList,yearsSpentAsWidow)??[];
    updateYearsSpent();
    updateWidowsAge();

    log('${widowsRegisteredChartData.length}');
      loadPage = false;
      notifyListeners();
    // }catch(e){
    //   log('Error: $e');
    // }
  }
  void printResult(){
    log('widowsAgeAtBereavementChartData: $yearsSpentAsWidowList\n${yearsSpentAsWidowList.length}');
  }
  void updateWidowsAge() async {
    widowsAgeAtBereavementChartData =  await myPort(graphDataList,widowsAgeEvaluated)??[];
    notifyListeners();
  }
void updateYearsSpent() async {
    yearsSpentAsWidowList =  await myPort(graphDataList,yearsSpentAsWidow)??[];
    notifyListeners();
  }

}
enum WidowAgeStage{
  lessThan20,
  twentyTo24,
  twentyFiveTo29,
  thirtyTo34,
  thirtyFiveTo39,
  fortyTo44,
  fortyFiveTo49,
  fiftyTo54,
  fiftyFiveTo59,
  sixtyPlus,
}
// otp_text_field/otp_text_field