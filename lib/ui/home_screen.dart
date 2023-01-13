import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graph_implementation/custom_widgets/custom_text.dart';
import 'dart:developer';
import 'package:graph_implementation/providers/home_viewmodel.dart';
import 'package:graph_implementation/utilities/graph_asset.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryBarChartModel> chartData = [
      CategoryBarChartModel(category: 'Owo', x: 7),
      CategoryBarChartModel(category: 'Ose', x: 7),
      CategoryBarChartModel(category: 'Ondo West', x: 6),
      // CategoryBarChartModel(category: 'Ondo West', x: 3),
      // CategoryBarChartModel(category: 'Ondo West', x: 3),
      // CategoryBarChartModel(category: 'Ondo West', x: 3),
      CategoryBarChartModel(category: 'Ondo East', x: 4),
      CategoryBarChartModel(category: 'Okitipupa', x: 5),
      CategoryBarChartModel(category: 'Odigbo', x: 8),
      CategoryBarChartModel(category: 'Irele', x: 7),
      CategoryBarChartModel(category: 'Ile Oluji/Oke Igbo', x: 6),
      CategoryBarChartModel(category: 'Ilaje', x: 5),
      CategoryBarChartModel(category: 'Ifedore', x: 2),
      CategoryBarChartModel(category: 'Idanre', x: 3),
      CategoryBarChartModel(category: 'Ese Odo', x: 5),
      CategoryBarChartModel(category: 'Akure North', x: 7),
      CategoryBarChartModel(category: 'Akoko S/W', x: 5),
      CategoryBarChartModel(category: 'Akoko S/E', x: 6),
      CategoryBarChartModel(category: 'Akoko N/W', x: 4),
      CategoryBarChartModel(category: 'Akoko N/E', x: 5),
      CategoryBarChartModel(category: 'Akure South', x: 5),
    ];
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.readData(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context,model,child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 154,
                  // width: 329,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1,1),
                        color: const Color(0xFF717171).withOpacity(0.20),
                      ),
                       BoxShadow(
                        offset: const Offset(-1,-1),
                        color: const Color(0xFF717171).withOpacity(0.20),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(
                      GraphAssets.blueGraph
                    ))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.body('TOTAL NUMBER OF WIDOWS REGISTERED'),
                          Image.asset(GraphAssets.profileImage,
                          // width: MediaQuery.of(context).size.width/3,
                          // height: MediaQuery.of(context).size.height/8,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomText.headline('${model.graphDataList.map<String>((e) => e.lga??'').toList().length}'),
                    ),
                    // Image.asset(GraphAssets.blueGraph),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: CustomText.headline('125'),
                    // )

                  ]),
                ),
                  Container(
                    margin: const EdgeInsets.only(top: 24,bottom: 32),
                  height: 154,
                  width: 329,
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(
                      GraphAssets.purpleGraph
                    )),
                    boxShadow: [
                       BoxShadow(
                        offset: const Offset(1,1),
                        color: const Color(0xFF717171).withOpacity(0.20),
                      ),
                       BoxShadow(
                        offset: const Offset(-1,-1),
                        color: const Color(0xFF717171).withOpacity(0.20),
                      ),
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.body('SELECT LOCAL GOVERNMENT'),
                          Image.asset(GraphAssets.homeIconImage,
                          // width: MediaQuery.of(context).size.width/3,
                          // height: MediaQuery.of(context).size.height/8,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomText.headline('${model.graphDataList.map<String>((e) => e.lga??'').toSet().length}'),
                    ),
                    // Image.asset(GraphAssets.blueGraph),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: CustomText.headline('125'),
                    // )


                  ]),
                                ),
                  SizedBox(
                    height: 600,
                    width: MediaQuery.of(context).size.width-68,
                    child: Material(
                      borderRadius: BorderRadius.circular(5.43),
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24,),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 16.0,top: 24),
                              child: Text('WIDOWS REGISTERED BY LOCAL GOVERNMENT'),
                            ),
                            Expanded(
                              child: RotatedBox(
                                quarterTurns: -3,
                                child: BarChart(

                                  BarChartData(
                                    borderData: FlBorderData(show: false,),
                                  // alignment: BarChartAlignment.center,
                                  // groupsSpace: 30,
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(sideTitles: SideTitles(interval: 1,reservedSize: 90,getTitlesWidget: (value,meta) {
                                      // log('${chartData[0]}');
                                      return RotatedBox(
                                          quarterTurns: -5,
                                          child: Text('${value.toInt()}',textAlign: TextAlign.end,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),));
                                    },showTitles: true)),
                                    bottomTitles: AxisTitles(
                                      // axisNameWidget: Text('WIDOWS REGISTERED BY LOCAL GOVERNMENT'),
                                    sideTitles: SideTitles(reservedSize: 90,getTitlesWidget: (value,meta) {
                                      // log('${chartData[0]}');
                                      return RotatedBox(
                                          quarterTurns: -5,
                                          child: Text('${chartData[value.toInt()].category} - ',textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),));
                                    },showTitles: true)),
                                    //   leftTitles: AxisTitles(
                                    //   // axisNameWidget: Text('WIDOWS REGISTERED BY LOCAL GOVERNMENT'),
                                    // sideTitles: SideTitles(getTitlesWidget: (value,meta) => RotatedBox(
                                    //    quarterTurns: -5,
                                    //   child: Text('$value')),showTitles: true)),
                                    show: true,
                                  ),
                                  // maxY: 6,
                                  // minY: 1,
                                  // baselineY: 0,
                                  barGroups: chartData.map<BarChartGroupData>((e) =>  BarChartGroupData(x: chartData.indexOf(e),
                                    barRods: [
                                      BarChartRodData(
                                          backDrawRodData: BackgroundBarChartRodData(
                                              color: const Color(0xFF602BF8).withOpacity(0.1),
                                              fromY: getGreatestValue(chartData).toDouble(),
                                              show: true),
                                          toY: e.x.toDouble(),
                                          width: 10,
                                          color: const Color(0xFF602BF8),
                                          borderRadius: BorderRadius.circular(0)),
                                    ],
                                    ),).toList(),

                                    // barGroups: [
                                    //   BarChartGroupData (x: 0, barRods: [
                                    //     BarChartRodData(toY: chartData[0].x.toDouble()),
                                    //   ]),
                                    //   BarChartGroupData(x: 1,barRods: [
                                    //     BarChartRodData(toY: chartData[1].x.toDouble()),
                                    //   ]),
                                    //   BarChartGroupData(x: 2,barRods: [
                                    //     BarChartRodData(toY: chartData[2].x.toDouble()),
                                    //   ]),
                                    // ]
                                    // read about it in the BarChartData section
                                  ),
                                  swapAnimationDuration: const Duration(milliseconds: 150), // Optional
                                  swapAnimationCurve: Curves.linear, // Optional
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
  int getGreatestValue(List<CategoryBarChartModel> chartData){
    List<int> listVal = chartData.map<int>((e) => e.x).toList();
    listVal.sort();
    // log('length: ${listVal.toSet().length}\n lastVal: ${listVal.last}\nFirstVal: ${listVal.first}');
    return listVal.last;
  }
}
class CategoryBarChartModel{
  String category;
  int x;
  CategoryBarChartModel({required this.category,required this.x});
  @override
  String toString() {
    // TODO: implement toString
    return """
    category: $category,
    x: $x""";
  }
}